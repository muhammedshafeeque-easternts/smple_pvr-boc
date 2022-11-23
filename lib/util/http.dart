import 'package:dio/dio.dart';

class Http {
final Dio _dio;
final Options _options;
  Http()
  : _dio = Dio(),
    _options = Options();
  
  Future<dynamic>getRequest({required String url, Map<String,dynamic>? queryParameters})async{
    try {
      Response response = await _dio.get(url,options: _options,queryParameters: queryParameters);
      return response.data;
    } catch (e) {
      print(e);
    }

  }
  
}