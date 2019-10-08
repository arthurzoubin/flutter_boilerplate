import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_boilerplate/pages/home/home.page.dart';
import 'package:flutter_boilerplate/pages/home/home.config.dart';
import 'package:flutter_boilerplate/bloC/home.bloc.dart';
import 'package:flutter_boilerplate/bloc/search_bloc/search.bloc.dart';
import 'package:flutter_boilerplate/bloc/theme.bloc.dart';
import 'package:flutter_boilerplate/themes/themes.dart';

Widget createApp() {
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
          home: Home(title: HomePageTitle,),
        );
      },
    ),
  );
}
