import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_boilerplate/bloc/search_bloc/search.bloc.dart';
import 'package:flutter_boilerplate/bloc/search_bloc/search.bloc.event.dart';

class SearchBar extends StatefulWidget {
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _textController = TextEditingController();
  GithubSearchBloc _gitSearchBloc;

  @override
  void initState() {
    super.initState();
    _gitSearchBloc = BlocProvider.of<GithubSearchBloc>(context);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      autocorrect: false,
      onChanged: (text) {
        _gitSearchBloc.dispatch(SearchTextChange(text: text));
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        suffixIcon: GestureDetector(
          child: Icon(Icons.clear),
          onTap: _onClearTapped,
        ),
        border: InputBorder.none,
        hintText: "Enter a search term",
      ),
    );
  }

  void _onClearTapped() {
    _textController.text = "";
    _gitSearchBloc.dispatch(SearchTextChange(text: ""));
  }
}