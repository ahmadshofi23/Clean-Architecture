import 'package:dartz/dartz.dart';
import 'package:weathercleanarchitecture/data/failure.dart';
import 'package:weathercleanarchitecture/domain/entities/weather_entities.dart';
import 'package:weathercleanarchitecture/domain/repository/weather_repository.dart';

class GetCurrentWeather {
  final WeatherRepository repository;

  GetCurrentWeather(this.repository);

  Future<Either<Failure, Weather>> execute(String cityName) {
    return repository.getCurrentWeather(cityName);
  }
}
