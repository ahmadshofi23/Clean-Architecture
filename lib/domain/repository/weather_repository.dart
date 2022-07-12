import 'package:dartz/dartz.dart';
import 'package:weathercleanarchitecture/data/failure.dart';
import 'package:weathercleanarchitecture/domain/entities/weather_entities.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName);
}
