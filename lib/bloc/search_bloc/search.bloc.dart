import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutter_boilerplate/bloc/search_bloc/search.bloc.event.dart';
import 'package:flutter_boilerplate/bloc/search_bloc/search.bolc.state.dart';
import 'package:flutter_boilerplate/model/search/search.error.dart';
import 'package:flutter_boilerplate/model/search/search.list.dart';
import 'package:flutter_boilerplate/services/api/search/search.services.dart';

class GithubSearchBloc extends Bloc<GithubSearchEvent, GithubSearchState> {
  @override
  Stream<GithubSearchState> transformEvents(
    Stream<GithubSearchEvent> events,
    Stream<GithubSearchState> Function(GithubSearchEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<GithubSearchEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  void onTransition(Transition<GithubSearchEvent, GithubSearchState> transition) {
    print(transition);
  }

  @override
  GithubSearchState get initialState => SearchStateEmpty();

  @override
  Stream<GithubSearchState> mapEventToState(GithubSearchEvent event) async* {
    if (event is SearchTextChange) {
      final String searchString = event.text;
      if (searchString.isEmpty) {
        yield SearchStateEmpty();
      } else {
        yield SearchStateLoading();
        try {
          final response = await SearchServices.gitSearchByText(searchString);
          if (response.statusCode == 200) {
            final results = SearchList.fromJson(response.data);
            yield SearchStateSuccess(results.items);
          } else {
            throw SearchError.fromJson(response);
          }
        } catch (error) {
          print(error);
          yield error is SearchError
            ? SearchStateFailure(error.message)
            : SearchStateFailure("something went wrong");
        } 
      }
    }
  }
}