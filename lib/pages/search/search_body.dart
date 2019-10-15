import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_boilerplate/bloc/search_bloc/search_bloc.dart';
import 'package:flutter_boilerplate/bloc/search_bloc/search_bolc_state.dart';
import 'package:flutter_boilerplate/pages/search/search_list.dart';

class SearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GithubSearchBloc, GithubSearchState>(
      bloc: BlocProvider.of<GithubSearchBloc>(context),
      builder: (BuildContext context, GithubSearchState state) {
        if (state is SearchStateEmpty) {
          return Text("Please enter a term to begin");
        }
        if (state is SearchStateLoading) {
          return CircularProgressIndicator();
        }
        if (state is SearchStateFailure) {
          return Text(state.error);
        }
        if (state is SearchStateSuccess) {
          return state.items.isEmpty
            ? Text("No Results")
            : Expanded(child: SearchResultList(items: state.items,),);
        }
        return Text("Please enter a term to begin");
      },
    );
  }
}