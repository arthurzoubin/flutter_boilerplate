import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/pages/search/search.form.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Page"),
      ),
      body: SearchForm(),
    );
  }
}