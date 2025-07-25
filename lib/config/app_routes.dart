import 'package:flutter/material.dart';
import 'package:movie/page/home/screen/movie_search.dart';
import 'package:movie/page/movie/screen/movie_detail_screen.dart';
import 'package:movie/page/splash/splash_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String moviedetailscreen = '/moviedetailscreen';
  static const String splash = '/splash';


  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) =>  MovieSearchScreen());
      case moviedetailscreen:
        return MaterialPageRoute(builder: (_) =>  const MovieDetailScreen());
      case splash:
        return MaterialPageRoute(builder: (_) =>   Splashscreen());

      default:
        return null;
    }
  }
}
