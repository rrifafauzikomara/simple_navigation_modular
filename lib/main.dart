import 'dart:async';

import 'package:detail_movie/detail_movie.dart';
import 'package:favorited/favorited.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home/home.dart';
import 'package:movie/movie.dart';
import 'package:shared/shared.dart';
import 'package:tv_show/tv_show.dart';
import 'package:settings/settings.dart';

void main() {
  Modular.init(SharedModule());
  runApp(ModularApp(module: AppModule()));
}

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  Widget get bootstrap => MyApp();

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          Modular.get<NamedRoute>().splash,
          child: (_, arg) => SplashPage(),
        ),
        ModularRouter(Modular.get<NamedRoute>().detailMovie,
            module: DetailMovieModule()),
        ModularRouter(Modular.get<NamedRoute>().home, module: HomeModule()),
        ModularRouter(Modular.get<NamedRoute>().movie, module: MovieModule()),
        ModularRouter(Modular.get<NamedRoute>().tvShow, module: TvShowModule()),
        ModularRouter(Modular.get<NamedRoute>().settings,
            module: SettingsModule()),
        ModularRouter(Modular.get<NamedRoute>().favorite,
            module: FavoriteModule()),
      ];
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Modular.get<NamedRoute>().splash,
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _startSplashScreen() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, _navigationPage);
  }

  void _navigationPage() {
    Modular.to.pushReplacementNamed(Modular.get<NamedRoute>().home);
  }

  @override
  void initState() {
    super.initState();
    _startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('SplashScreen')),
    );
  }
}
