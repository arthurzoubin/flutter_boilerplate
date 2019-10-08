import 'package:dio/dio.dart';

BaseOptions defaultOptions = new BaseOptions(
  connectTimeout: 5000,
  receiveTimeout: 3000,
);

class DioManager {
  final String baseUrl;
  Map<String, dynamic> _headers;
  dynamic _payload;
  Map<String, dynamic> _queryParameters;
  String _uri;
  BaseOptions _options = defaultOptions;

  Dio dio = new Dio();

  DioManager({
    this.baseUrl,
  }) {
    _options = _options.merge(
      baseUrl: this.baseUrl,
    );
  }

  setHeaders(Map<String, dynamic> headers) {
    this._headers = headers;
  }

  setQueryParameters(Map<String, dynamic> params) {
    this._queryParameters = params;
    return this;
  }

  setPayload(dynamic payload) {
    this._payload = payload;
  }
  
  setUri(String uri) {
    this._uri = uri;
    return this;
  }

  Future doMethod(String method) async {
    BaseOptions options = this._options.merge(
      headers: this._headers,
      method: method,
    );
    dio.options = options;
    try {
      Response response = await dio.request(this._uri, data: this._payload, queryParameters: this._queryParameters);
      return response;
    } on DioError catch(e) {
      if(e.response != null) {
        print(e.response.data);
      } else{
        print(e.message);
      }
    }
  }

  doGet() {
    return this.doMethod("GET");
  }

  doPost() {
    return this.doMethod("POST");
  }
}