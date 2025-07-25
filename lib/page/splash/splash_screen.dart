import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/config/app_colors.dart';
import 'package:movie/config/app_routes.dart';
import 'package:movie/page/home/bloc/home_bloc.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
void initState() {
  super.initState();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    initFunction();
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("MOVIE", style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: AppConfig.white),),),
    );
  }

  initFunction() async{
    Navigator.pushNamed(context, AppRoutes.home);
    BlocProvider.of<HomeBloc>(context).add(MovieSerchBuildInitEvent());
    
  }
}