import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/shared.dart';

class FavoriteModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.get<NamedRoute>().favorite,
          child: (ctx, arg) => FavoritePage(),
        ),
        ModularRouter(
          Modular.get<NamedRoute>().detailFavorite,
          child: (ctx, arg) => DetailFavorite(),
        ),
      ];
}

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Detail Favorite'),
          onPressed: () =>
              Modular.link.pushNamed(Modular.get<NamedRoute>().detailFavorite),
        ),
      ),
    );
  }
}

class DetailFavorite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Favorite"),
      ),
      body: Center(child: Text('Detail Favorite')),
    );
  }
}
