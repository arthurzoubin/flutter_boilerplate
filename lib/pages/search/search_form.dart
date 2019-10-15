import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/pages/search/search_body.dart';

import 'package:flutter_boilerplate/pages/search/search_searchBar.dart';

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