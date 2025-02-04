import 'package:dio/dio.dart';

String baseUrl = "http://api.weatherapi.com/v1";
String API_KEY = "914c9fefbc404236b8c121215252201";

class NetworkConnector {
  late Dio _dio;

  Dio get dio => _dio;

  NetworkConnector() {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      queryParameters: {
        "key": API_KEY,
      },
      responseType: ResponseType.json,
    ));

    _dio.interceptors.add(InterceptorsWrapper(
        onError: (DioException exception, ErrorInterceptorHandler handler) {
      handler.next(exception);
    }));
  }
}

class DioErrorUtil {
  static String handleError(DioException error) {
    String errorDescription = '';
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        errorDescription = 'Connection timeout has expired';
        break;
      case DioExceptionType.cancel:
        errorDescription = 'The request was canceled';
        break;
      case DioExceptionType.connectionError:
        errorDescription = 'Connection error';
        break;
      default:
        errorDescription = 'Unknown error';
    }
    return errorDescription;
  }
}
