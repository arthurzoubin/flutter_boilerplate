import 'package:flutter_boilerplate/model/search/search_item.dart';

class SearchList {
  final List<SearchItem> items;

  const SearchList({
    this.items,
  });

  static SearchList fromJson(dynamic json) {
    final items = (json["items"] as List<dynamic>)
      .map((dynamic item) =>
        SearchItem.fromJson(item as Map<String, dynamic>)
      ).toList();
    return SearchList(items: items);  
  }
}