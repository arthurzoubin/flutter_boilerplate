import 'package:equatable/equatable.dart';

abstract class GithubSearchEvent extends Equatable {
  GithubSearchEvent([List props = const []]) : super(props);
}

class SearchTextChange extends GithubSearchEvent {
  final String text;

  SearchTextChange({ this.text }) : super([text]);

  @override
  String toString() => "SearchTextChange { text: $text}";
}