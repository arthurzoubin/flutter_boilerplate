import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/model/search/search_item.dart';

abstract class GithubSearchState extends Equatable {
  GithubSearchState([List props = const []]) : super(props);
}

class SearchStateEmpty extends GithubSearchState {
  @override
  String toString() => "SearchStateEmpty";
}

class SearchStateLoading extends GithubSearchState {
  @override
  String toString() => "SearchStateLoading";
}

class SearchStateSuccess extends GithubSearchState {
  final List<SearchItem> items;

  SearchStateSuccess(this.items) : super([items]);

  @override
  String toString() => "SearchStateSuccess";
}

class SearchStateFailure extends GithubSearchState {
  final String error;

  SearchStateFailure(this.error): super([error]);

  @override
  String toString() => "SearchStateFailure";
}