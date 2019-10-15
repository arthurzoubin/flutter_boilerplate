import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_boilerplate/application.dart';
import 'package:flutter_boilerplate/navigation/routes.dart';
import 'package:flutter_boilerplate/bloC/home_bloc.dart';
import 'package:flutter_boilerplate/bloc/search_bloc/search_bloc.dart';
import 'package:flutter_boilerplate/bloc/theme_bloc.dart';
import 'package:flutter_boilerplate/themes/themes.dart';

Widget createApp() {
  // Router
  Router router = new Router();
  Routes.configureRoutes(router);
  Application.router = router;

  return MultiBlocProvider(
    providers: [
      BlocProvider<CounterBloc>(
          builder: (BuildContext context) => CounterBloc()),
      BlocProvider<ThemeBloc>(
        builder: (BuildContext context) => ThemeBloc(),
      ),
      BlocProvider<GithubSearchBloc>(
        builder: (BuildContext context) => GithubSearchBloc(),
      )
    ],
    child: BlocBuilder<ThemeBloc, bool>(
      builder: (BuildContext context, bool state) {
        return MaterialApp(
          title: "Flutter Boilerplate",
          theme: state ? defaultTheme : purpleTheme,
          onGenerateRoute: Application.router.generator,
        );
      },
    ),
  );
}
