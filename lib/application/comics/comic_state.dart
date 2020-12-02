import 'package:injectable/injectable.dart';

import '../../domain/core/model/comic_model.dart';
import '../../infrastructure/comic/services/comic_services.dart';

@singleton
class ComicState{

  ComicState(this.comicServices);
  
  final ComicServices comicServices;

  ComicModel comics;

  int indexComicSelected;

  Future<ComicModel> getComics() async {
    final ComicModel response = await comicServices.getComics();
    
    return comics = response;
  }


}