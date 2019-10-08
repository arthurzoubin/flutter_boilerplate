import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/pages/search/search.body.dart';

import 'package:flutter_boilerplate/pages/search/search.searchBar.dart';

class SearchForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SearchBar(),
        SearchBody(),
      ],
    );
  }
}