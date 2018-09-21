import 'dart:async';

import 'package:dio/dio.dart';

class HttpUtil {
  static const String POST = 'post';
  static const String GET = 'get';
  static String _baseUrl;
  static String _sessionId;
  static Dio _dio;
  static bool _isDebug;

  static set sessionId(String value) {
    _sessionId = value;
  }

  static void init(String baseUrl, bool isDebug) {
    _isDebug = isDebug;
    _baseUrl = baseUrl;
    Options options = new Options(
        baseUrl: baseUrl, connectTimeout: 10000, receiveTimeout: 10000);
    _dio = new Dio(options);
    if (_isDebug) {
      _dio.interceptor.request.onSend = (Options options) {
        print('Options:${options.toString()}\n');
        return options;
      };
      _dio.interceptor.response.onSuccess = (Response response) {
        print('Response${response.data['result']['userId'].toString()}');
        return response;
      };
      _dio.interceptor.response.onError = (DioError error) {
        print('DioError${error.response.data.toString()}');
        return error;
      };
    }
  }

  static void get(Map params, Function callback,
      {Function errorCallback, Map<String, String> headers}) async {
    _doBeforeRequest(params);
    await _dio
        .get('', data: new FormData.from(params))
        .then((Response response) {
      if (_isDebug) _printResponse(response, params);
      callback(response.data);
    }).catchError((DioError error) {
      if (_isDebug) _printError(error, params);
      errorCallback(error.response.data);
    });
  }

  static void post(
      Map params, Function callback, Function errorCallback) async {
    _doBeforeRequest(params);
    await _dio
        .post('', data: new FormData.from(params))
        .then((Response response) {
      if (_isDebug) _printResponse(response, params);
      callback(response.data);
    }).catchError((DioError error) {
      if (_isDebug) _printError(error, params);
      errorCallback(error.response.data);
    });
  }

  static void _doBeforeRequest(Map params) {
    if (_sessionId != null) {
      params['sessionId'] = _sessionId;
    }
    params['appKey'] = 'dongjiantong';
  }

  static void _printResponse(Response response, Map params) {
    print(
        "HttpRequest:---------------------------------------------------------\n");
    print('BaseUrl:$_baseUrl\n');
    print('pampasCall:${params['pampasCall']}\n');
    print('Response:${response.data.toString()}');
  }

  static void _printError(Error error, Map params) {
    print(
        "HttpRequest:---------------------------------------------------------\n");
    print('BaseUrl:$_baseUrl\n');
    print('pampasCall:${params['pampasCall']}\n');
    print('Error:${error.toString()}');
  }
}

class SuccessBean<T> {
  bool success;
  int code;
  T result;
}
