import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/pages/home/home_config.dart';
import 'package:flutter_boilerplate/pages/home/home_page.dart';
import 'package:flutter_boilerplate/pages/search/search_page.dart';

Handler homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Home(title: HomePageTitle,);
  }
);

Handler searchPageHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return SearchPage();
  }
);

Handler notFoundHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return Text("Page not found.");
  }
);