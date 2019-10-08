import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_boilerplate/bloc/theme.bloc.dart';
import 'package:flutter_boilerplate/pages/search/search.form.dart';

class Home extends StatelessWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final ThemeBloc _themeBloc = BlocProvider.of<ThemeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SearchForm(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.insert_comment),
        onPressed: () {
          _themeBloc.dispatch(ChangeTheme());
        },
      ),
    );
  }
}
