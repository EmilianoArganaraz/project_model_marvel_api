import 'package:flutter/material.dart';
import 'package:proyect_model_test/application/comics/comic_state.dart';
import 'package:proyect_model_test/presentation/core/styles/general_styles.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ComicDetail extends StatelessWidget {
  const ComicDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ReactiveModel<ComicState> _comicState = RM.get<ComicState>();

    final Size mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: StateBuilder<ComicState>(
            observe: () => _comicState,
            builder: (_, ReactiveModel<ComicState> model) => Column(
              children: <Widget>[
                const SizedBox(height: 20),
                Hero(
                    tag:
                        'comicTitle-${model.state.indexComicSelected.toString()}',
                    child: SizedBox(
                      width: mediaQuery.width,
                      child: Text(
                        model.state.comics.data
                            .results[model.state.indexComicSelected].title,
                        style: comicTitle,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                    )),
                const SizedBox(height: 20),
                Hero(
                  tag: 'comicImage-${model.state.indexComicSelected}',
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(20)),
                      child: Container(
                        width: mediaQuery.width * 0.8,
                        height: mediaQuery.height * 0.6,
                        child: FadeInImage(
                            fit: BoxFit.contain,
                            placeholder:
                                const AssetImage('assets/img/loading.gif'),
                            // image: AssetImage('assets/img/no-image.png'),
                            image: model
                                    .state
                                    .comics
                                    .data
                                    .results[model.state.indexComicSelected]
                                    .images
                                    .isEmpty
                                ? const AssetImage('assets/img/no-image.png')
                                : NetworkImage(
                                    '${model.state.comics.data.results[model.state.indexComicSelected].images[0].path}.${model.state.comics.data.results[model.state.indexComicSelected].images[0].extension}')),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: mediaQuery.width,
                    child: Text(
                      model.state.comics.data
                          .results[model.state.indexComicSelected].description,
                      style: comicTitle,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
