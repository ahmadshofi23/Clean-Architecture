import 'dart:convert';

import 'package:weathercleanarchitecture/data/constants.dart';
import 'package:weathercleanarchitecture/data/exception.dart';
import 'package:weathercleanarchitecture/data/model/weather_model.dart';

import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    // TODO: implement getCurrentWeather
    final response =
        await client.get(Uri.parse(Urls.currentWeatherByName(cityName)));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
