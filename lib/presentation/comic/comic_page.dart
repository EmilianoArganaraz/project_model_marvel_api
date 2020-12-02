import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:proyect_model_test/config/resources/color_palette.dart';
import 'package:proyect_model_test/config/routes/routing.gr.dart';
import 'package:proyect_model_test/domain/core/model/comic_model.dart';
import 'package:proyect_model_test/presentation/core/styles/general_styles.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../application/comics/comic_state.dart';
import '../../config/injectable/injectable.dart';
import '../../infrastructure/comic/services/comic_services.dart';

class ComicPage extends StatelessWidget implements AutoRouteWrapper {
  const ComicPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ReactiveModel<ComicState> _comicState = RM.get<ComicState>();
    final Size mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Model'),
        actions: const <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: ColorPalette.primaryColorLight,
              ),
              onPressed: null)
        ],
        backgroundColor: ColorPalette.primaryGrey,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: WhenRebuilderOr<ComicState>(
              initState: (_, __) =>
                  _comicState.setState((ComicState s) => s.getComics()),
              observe: () => _comicState,
              onWaiting: () => const Center(child: CircularProgressIndicator()),
              builder: (BuildContext context, _) => SizedBox(
                    height: mediaQuery.height,
                    child: GridView.count(
                        padding: const EdgeInsets.all(10),
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 20,
                        childAspectRatio: 2 / 4,
                        crossAxisCount: 2,
                        children: buildList(
                            _comicState.state.comics.data, mediaQuery)),
                  )),
        ),
      ),
    );
  }

  List<Widget> buildList(Data data, Size size) {
    final List<Widget> cards = <Widget>[];
    final ReactiveModel<ComicState> _comicState = RM.get<ComicState>();

    if ((data.count ?? 0) != 0) {
      cards.addAll(List<Widget>.generate(
          data.count,
          (int index) => GestureDetector(
                onTap: () {
                  _comicState
                    .setState((ComicState s) => s.indexComicSelected = index);
                  ExtendedNavigator.root.push(Routes.comicDetail);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorPalette.primaryGrey,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            blurRadius: 1,
                            color: Colors.grey[800],
                            spreadRadius: 1)
                      ]),
                  child: Column(
                    children: <Widget>[
                      Hero(
                        tag: 'comicImage-${index.toString()}',
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20)),
                          child: AspectRatio(
                            aspectRatio: 2 / 3,
                            child: FadeInImage(
                                fit: BoxFit.cover,
                                placeholder:
                                    const AssetImage('assets/img/loading.gif'),
                                image: data.results[index].images.isEmpty
                                    ? const AssetImage('assets/img/no-image.png')
                                    : NetworkImage(
                                        '${data.results[index].images[0].path}.${data.results[index].images[0].extension}')),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Flexible(
                        child: Hero(
                          flightShuttleBuilder: _flightShuttleBuilder,
                          tag: 'comicTitle-${index.toString()}',
                          child: SizedBox(
                            width: size.width * 0.4,
                            height: 80,
                            child: Text(
                              data.results[index].title,
                              style: comicTitle,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )));
    } else {
      cards.add(const CircularProgressIndicator());
    }

    return cards;
  }

  Widget _flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    return DefaultTextStyle(
      style: DefaultTextStyle.of(toHeroContext).style,
      child: toHeroContext.widget,
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return Injector(
      inject: <Injectable>[
        Inject<ComicState>(() => ComicState(getIt<ComicServices>()))
      ],
      builder: (_) => this,
    );
  }
}
