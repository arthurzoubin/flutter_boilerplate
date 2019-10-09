import 'package:fluro/fluro.dart';

import 'package:flutter_boilerplate/navigation/route_handles.dart';

class Routes {
  static String root = "/";
  static String searchPage = '/search';

  static void configureRoutes(Router router) {
    router.notFoundHandler = notFoundHandler;

    router.define(root, handler: homeHandler);
    router.define(searchPage, handler: searchPageHandler);
  }
}