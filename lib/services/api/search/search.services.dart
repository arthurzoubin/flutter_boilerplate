
import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/constants/api_constants.dart';
import 'package:flutter_boilerplate/utils/request/dio_manager.dart';

DioManager dioManager = new DioManager(baseUrl: "https://api.github.com/");

class SearchServices {
  static Future gitSearchByText(text) async {
    String uri = ApiConstants.search.uriGet;
    Map<String, dynamic> params = {
      "q": text,
    };
    Response response = await dioManager
      .setUri(uri)
      .setQueryParameters(params)
      .doGet();
    return response;  
  }
}