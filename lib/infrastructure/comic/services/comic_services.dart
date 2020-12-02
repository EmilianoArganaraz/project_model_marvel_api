import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:proyect_model_test/domain/core/model/comic_model.dart';

import '../repositories/comic_repository.dart';

@injectable
class ComicServices {

  ComicServices(this.comicRepository);

  final ComicRepository comicRepository;


  Future<ComicModel> getComics() async {
    final Response<dynamic> result = await comicRepository.attempGetComics();

    if(result.statusCode == 200){
      final ComicModel comics = ComicModel.fromJson(result.data);
      return comics;
    }else{
      return null;
    }

  }

}