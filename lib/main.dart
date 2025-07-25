import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movie/config/app_routes.dart';
import 'package:movie/config/app_theme.dart';
import 'package:movie/config/size_config.dart';
import 'package:movie/models/hive_search.dart';
import 'package:movie/page/home/bloc/home_bloc.dart';
import 'package:movie/page/movie/bloc/movie_detail_bloc.dart';
import 'package:movie/utils/network_util.dart';


 void main() async{
  WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    Hive.registerAdapter(SearchAdapter());
    await Hive.openBox<List>('last_search_box');
  DioSetup();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return 
    MultiBlocProvider(
      providers: [    
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => MovieDetailBloc(),
        ),
      ],
      child: 
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      )
    );
  }
}

