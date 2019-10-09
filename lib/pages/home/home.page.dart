import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_boilerplate/bloC/home.bloc.dart';
import 'package:flutter_boilerplate/bloc/theme.bloc.dart';
import 'package:flutter_boilerplate/navigation/application.dart';
import 'package:flutter_boilerplate/navigation/routes.dart';

class Home extends StatelessWidget {
  Home({Key key, this.title}): super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = BlocProvider.of<CounterBloc>(context);
    final ThemeBloc _themeBloc = BlocProvider.of<ThemeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, count) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("You have pushed the button this many times:"),
                Text(
                  "$count",
                  style: Theme.of(context).textTheme.display1,
                ),
                GestureDetector(
                  onTap: () {
                    Application.router.navigateTo(context, Routes.searchPage, transition: TransitionType.native);
                  },
                  child: Text("Go to search page"),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: "Increment",
              child: Icon(Icons.add),
              onPressed: () {
                _counterBloc.dispatch(CounterEvent.increment);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: "Decrement",
              child: Icon(Icons.remove),
              onPressed: () {
                _counterBloc.dispatch(CounterEvent.decrement);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: FloatingActionButton(
              heroTag: "Theme",
              child: Icon(Icons.insert_comment),
              onPressed: () {
                _themeBloc.dispatch(ChangeTheme());
              },
            ),
          ),
        ],
      ),
    );
  }
}