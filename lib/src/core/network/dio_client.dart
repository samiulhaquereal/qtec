import 'package:ecommerce/src/app_config/imports/import.dart';
import 'dart:developer';

class RestApi {
  RestApi({
    required this.apiResponseHandler,
    required this.apiErrorHandler,
  });

  final ApiResponseHandler apiResponseHandler;
  final ApiErrorHandler apiErrorHandler;

  Dio _createDioInstance(String baseUrl) {
    final dio = Dio()
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = const Duration(minutes: 5)
      ..options.receiveTimeout = const Duration(minutes: 5)
      ..options.responseType = ResponseType.json
      ..interceptors.add(PrettyDioLogger());
    return dio;
  }

  Map<String, String> _buildHeaders({Map<String, String>? additionalHeaders, String? cookies}) {
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      if (additionalHeaders != null) ...additionalHeaders,
    };
    if (cookies != null && cookies.isNotEmpty) {
      headers.addAll({'Cookie': cookies});
    }
    return headers;
  }

  Future<dynamic> get({required String baseURL,required String endpoint, Map<String, String>? params, String? cookies, Map<String, String>? additionalHeaders, bool? needEncode}) async {
    return _sendRequest(
        method: 'GET',
        baseURL: baseURL,
        endpoint: endpoint,
        params: params,
        setCookies: cookies,
        needEncode: needEncode,
        additionalHeaders: additionalHeaders
    );
  }

  Future<dynamic> post({required String baseURL,required String endpoint, dynamic body, String? cookies, Map<String, String>? additionalHeaders, bool? needEncode}) async {
    return _sendRequest(
      method: 'POST',
      baseURL: baseURL,
      endpoint: endpoint,
      body: body,
      setCookies: cookies,
      additionalHeaders: additionalHeaders,
      needEncode: needEncode,
    );
  }

  Future<dynamic> put({required String baseURL,required String endpoint, dynamic body, String? cookies, Map<String, String>? additionalHeaders, bool? needEncode}) async {
    return _sendRequest(
        method: 'PUT',
        baseURL: baseURL,
        endpoint: endpoint,
        body: body,
        setCookies: cookies,
        needEncode: needEncode,
        additionalHeaders: additionalHeaders
    );
  }

  Future<dynamic> patch({required String baseURL,required String endpoint, dynamic body, String? cookies, Map<String, String>? additionalHeaders, bool? needEncode}) async {
    return _sendRequest(
        method: 'PATCH',
        baseURL: baseURL,
        endpoint: endpoint,
        body: body,
        needEncode: needEncode,
        setCookies: cookies,
        additionalHeaders: additionalHeaders
    );
  }

  Future<dynamic> delete({required String baseURL,required String endpoint, dynamic body, String? cookies, Map<String, String>? params, Map<String, String>? additionalHeaders}) async {
    return _sendRequest(
        method: 'DELETE',
        endpoint: endpoint,
        params: params,
        baseURL: baseURL,
        setCookies: cookies,
        additionalHeaders: additionalHeaders
    );
  }

  Future<dynamic> _sendRequest({
    required String method,
    bool? needEncode,
    required String baseURL,
    required String endpoint,
    dynamic? body,
    Map<String, String>? params,
    String? setCookies,
    Map<String, String>? additionalHeaders
  }) async {
    //String os = RetCore.getOS();
    String os = '';
    if (os == 'Web') {
      return _sendRequestHandler(
          method: method,
          baseURL: baseURL,
          needEncode: needEncode,
          endpoint: endpoint,
          body: body,
          params: params,
          setCookies: setCookies,
          additionalHeaders: additionalHeaders
      );
    } else {
      final receivePort = ReceivePort();
      await Isolate.spawn(_isolateRequestHandler, {
        'sendPort': receivePort.sendPort,
        'method': method,
        'needEncode': needEncode,
        'endpoint': endpoint,
        'baseURL': baseURL,
        'body': body,
        'params': params,
        'setCookies': setCookies,
        'additionalHeaders': additionalHeaders,
      });
      final response = await receivePort.first;
      return response;
    }
  }

  Future<void> _isolateRequestHandler(Map<String, dynamic> params) async {
    final sendPort = params['sendPort'];
    final method = params['method'];
    final baseURL = params['baseURL'];
    final needEncode = params['needEncode'];
    final endpoint = params['endpoint'];
    final body = params['body'];
    final queryParams = params['params'];
    final setCookies = params['setCookies'];
    final additionalHeaders = params['additionalHeaders'];

    final response = await _sendRequestHandler(
        method: method,
        needEncode: needEncode,
        endpoint: endpoint,
        baseURL: baseURL,
        body: body,
        params: queryParams,
        setCookies: setCookies,
        additionalHeaders: additionalHeaders
    );
    sendPort.send(response);
  }

  Future<dynamic> _sendRequestHandler<T>({
    required String method,
    bool? needEncode,
    required String baseURL,
    required String endpoint,
    dynamic? body,
    Map<String, String>? params,
    SendPort? sendPort,
    String? setCookies,
    Map<String, String>? additionalHeaders
  }) async {
    try {
      final dio = _createDioInstance(baseURL);
      Response response;
      final uri = Uri.parse('$baseURL$endpoint');
      final requestHeaders = _buildHeaders(cookies: setCookies, additionalHeaders: additionalHeaders);
      final requestBody = needEncode == true ? jsonEncode(body) : body;
      switch (method) {
        case 'GET':
          response = await dio.get(uri.toString(), queryParameters: params, options: Options(headers: requestHeaders))
              .then((value) => value)
              .catchError(apiErrorHandler.handleException
          );
          break;
        case 'POST':
          response = await dio.post(uri.toString(), data: requestBody, options: Options(headers: requestHeaders))
              .then((value) => value)
              .catchError(apiErrorHandler.handleException
          );
          break;
        case 'PUT':
          response = await dio.put(uri.toString(), data: requestBody, options: Options(headers: requestHeaders))
              .then((value) => value)
              .catchError(apiErrorHandler.handleException
          );
          break;
        case 'PATCH':
          response = await dio.patch(uri.toString(), data: requestBody, options: Options(headers: requestHeaders))
              .then((value) => value)
              .catchError(apiErrorHandler.handleException
          );
          break;
        case 'DELETE':
          response = await dio.delete(uri.toString(), data: requestBody, options: Options(headers: requestHeaders))
              .then((value) => value)
              .catchError(apiErrorHandler.handleException
          );
          break;
        default:
          throw Exception('Unsupported HTTP method: $method');
      }
      String cookieResponse = apiResponseHandler.cookieSet(response: response);
      var handleResponse = apiResponseHandler.handleResponse(response: response, sendPort: sendPort);
      Map<String, dynamic> data = {
        "response": handleResponse,
        "cookie": cookieResponse,
      };
      return data;
    } catch (e) {
      log('Error occurred while making $method request: $e');
    }
  }
}
