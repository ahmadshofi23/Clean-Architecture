import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weathercleanarchitecture/domain/entities/weather_entities.dart';
import 'package:weathercleanarchitecture/domain/usecase/get_current_weather_usecase.dart';

import '../helper/test_helper.mocks.dart';

void main() {
  late MockWeatherRepository mockWeatherRepository;
  late GetCurrentWeather usecase;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    usecase = GetCurrentWeather(mockWeatherRepository);
  });

  const testWeatherDetail = Weather(
    cityName: 'Jakarta',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 302.28,
    pressure: 1009,
    humidity: 70,
  );

  const tCityName = 'Jakarta';

  test('should get current weather detail from the repository', () async {
    //arrange
    when(mockWeatherRepository.getCurrentWeather(tCityName))
        .thenAnswer((_) async => const Right(testWeatherDetail));
    //act
    final resutl = await usecase.execute(tCityName);

    //assert
    expect(resutl, equals(Right(testWeatherDetail)));
  });
}
