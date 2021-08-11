import 'dart:convert';
import 'package:amaizi/api/dio_api.dart';


class Api extends DioAPi {
  Api(String apiUrl) : super(apiUrl);

  Future getUsers() {
    return dio.get("/users/");
  }

}

Api api = Api('https://jsonplaceholder.typicode.com/');


