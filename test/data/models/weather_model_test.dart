import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:weathercleanarchitecture/data/model/weather_model.dart';
import 'package:weathercleanarchitecture/domain/entities/weather_entities.dart';

import '../../helper/json_reader.dart';

void main() {
  const tWeatherModel = WeatherModel(
    cityName: 'Jakarta',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 302.28,
    pressure: 1009,
    humidity: 70,
  );

  const tWeather = Weather(
    cityName: 'Jakarta',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 302.28,
    pressure: 1009,
    humidity: 70,
  );

  group('to entity', () {
    test('should be a subclass of weather entity', () async {
      //assert
      final result = tWeatherModel.toEntity();
      expect(result, equals(tWeather));
    });
  });

  group('from json', () {
    test('should be a subclass of weather entity', () async {
      //arrange
      final Map<String, dynamic> jsonMap = json.decode(
        readJson('helper/dummy_data/dummy_weather_response.json'),
      );

      //act
      final result = WeatherModel.fromJson(jsonMap);

      //assert
      expect(result, equals(tWeatherModel));
    });
  });

  group('to JSON', () {
    test('should return a json map containing proper data', () async {
      //act
      final result = tWeatherModel.toJson();

      //assert
      final expectedJsonMap = {
        'weather': [
          {
            'main': 'Clouds',
            'description': 'few clouds',
            'icon': '02d',
          }
        ],
        'main': {
          'temp': 302.28,
          'pressure': 1009,
          'humidity': 70,
        },
        'name': 'Jakarta',
      };

      expect(result, equals(expectedJsonMap));
    });
  });
}
