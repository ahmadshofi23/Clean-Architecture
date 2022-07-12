import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:weathercleanarchitecture/data/data_source/remote_data_source.dart';
import 'package:weathercleanarchitecture/domain/repository/weather_repository.dart';

@GenerateMocks(
  [
    WeatherRepository,
    RemoteDataSource,
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
