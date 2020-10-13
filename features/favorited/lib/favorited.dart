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
  ];
}

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Favorite"),
      ),
    );
  }
}
