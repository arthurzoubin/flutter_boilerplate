import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/model/search/search.item.dart';
import 'package:flutter_boilerplate/pages/search/search.item.dart';

class SearchResultList extends StatelessWidget {
  final List<SearchItem> items;

  const SearchResultList({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext content, int index) {
        return SearchResultItem(item: items[index],);
      },
    );
  }
}