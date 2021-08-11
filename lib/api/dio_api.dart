import 'dart:convert';
import 'package:dio/dio.dart';

class DioAPi {
  Dio dio;
  
  DioAPi(String apiUrl){
    dio = Dio();
    dio.options.baseUrl = apiUrl;
    dio.interceptors.add(InterceptorsWrapper(onRequest: _requestIntercept));
    dio.interceptors.add(InterceptorsWrapper(onResponse: _responseIntercept));
    dio.interceptors.add(InterceptorsWrapper(onError: _errorIntercept));
  }

  _requestIntercept(RequestOptions options) async {
    // if(await authManager.isLoggedIn()){
    //   String token = await authManager.getAccessToken();
    //   options.headers["apiKey"] = "";
    //   options.headers.addAll({"Authorization" : "Bearer $token"});
    // }
    print("REQUEST: ${options.method}: ${options.baseUrl}${options.path}${options.queryParameters}");
    print("BODY: ${json.encode(options.data)}");

    return options;
  }

  _responseIntercept(Response response) async {
    print("${response.request?.path} ${response.data}");
    return response;
  }

  _errorIntercept(DioError error) async {
    print("${error.request?.path} ${error.response?.data}");
    if(error.response?.statusCode == 401){
      print("401 ERROR");
      //authManager.deactivated = true;
      //await authManager.logout();
    }
  }
}
