import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioHelper {
  static Dio? dio;
  static SharedPreferences? sharedPreferences;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://magdsoft-internship.herokuapp.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(
      {required String url,  Map<String, dynamic>? query}) async {
    return await dio!.get(url, queryParameters: query);
  }

  static Future<bool> removeData(String id) async
  {
    return await sharedPreferences!.remove(id);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> body,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio!.post(url, data: body);
  }
}