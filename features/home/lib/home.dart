import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movie/movie.dart';
import 'package:shared/shared.dart';
import 'package:tv_show/tv_show.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((_) => MoviePage()),
        Bind((_) => TvShowPage()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.get<NamedRoute>().home,
            child: (_, arg) => HomePage()),
      ];
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _bottomNavIndex = 0;

  List<Widget> _listWidget = [
    Modular.get<MoviePage>(),
    Modular.get<TvShowPage>(),
  ];

  List<BottomNavigationBarItem> _bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.movie),
      label: 'Movie',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.tv_sharp),
      label: 'Tv Show',
    ),
  ];

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _listWidget[_bottomNavIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        items: _bottomNavBarItems,
        onTap: _onBottomNavTapped,
      ),
    );
  }
}
