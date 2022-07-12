import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:weathercleanarchitecture/data/data_source/remote_data_source.dart';
import 'package:weathercleanarchitecture/data/exception.dart';
import 'package:weathercleanarchitecture/domain/entities/weather_entities.dart';
import 'package:weathercleanarchitecture/data/failure.dart';
import 'package:weathercleanarchitecture/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final RemoteDataSource remoteDataSource;
  WeatherRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName) async {
    // TODO: implement getCurrentWeather
    try {
      final result = await remoteDataSource.getCurrentWeather(cityName);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
