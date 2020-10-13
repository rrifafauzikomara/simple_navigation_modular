import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared/shared.dart';

class TvShowModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.get<NamedRoute>().tvShow,
          child: (ctx, arg) => TvShowPage(),
        ),
      ];
}

class TvShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tv Show"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Modular.to.pushNamed(Modular.get<NamedRoute>().settings);
          },
          child: Text("Settings"),
        ),
      ),
    );
  }
}
