import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/shared.dart';

class MovieModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.get<NamedRoute>().movie,
          child: (ctx, arg) => MoviePage(),
        ),
      ];
}

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Modular.to.pushNamed(Modular.get<NamedRoute>().detailMovie);
          },
          child: Text("Detail Movie"),
        ),
      ),
    );
  }
}
