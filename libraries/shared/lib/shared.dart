import 'package:flutter_modular/flutter_modular.dart';

class SharedModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((_) => NamedRoute()),
      ];

  @override
  List<ModularRouter> get routers => [];
}

class NamedRoute {
  String splash = '/';
  String detailMovie = '/detail_movie';
  String home = '/home';
  String movie = '/movie';
  String tvShow = '/tv_show';
  String settings = '/settings';
  String favorite = '/favorite';
}
