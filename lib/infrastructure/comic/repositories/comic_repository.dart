import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/api_marvel/api_marvel.dart';

@lazySingleton
class ComicRepository {
  ComicRepository(this.apiMarvel);

  final ApiMarvel apiMarvel;

  Future<Response<dynamic>> attempGetComics() async {
    try {
      final Map<String, dynamic> data = <String, dynamic>{'offset': 30};

      final Response<dynamic> response =
          await apiMarvel.client.get('comics', queryParameters: data);
      // print(response.toString());
      return response;
    } on DioError catch (e) {
      // print(e.response.toString());
      return e.response;
    }
  }
}
