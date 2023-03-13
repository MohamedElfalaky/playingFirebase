import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:try_firbs/helpers/Variables.dart';
import 'package:try_firbs/helpers/myApplication.dart';

class DioHelper {
  static Dio? dio;
  static Dio? dioLogOut;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "https://playfirebase-9a06d-default-rtdb.firebaseio.com/",
        receiveDataWhenStatusError: true,
        connectTimeout: Duration(seconds: 20),
        receiveTimeout: Duration(seconds: 20),
        headers: myHeader));
  }

  static Future<Response?> getData(
      {required String url, required Map<String, dynamic> query}) async {
    var response = await dio!.get(url, queryParameters: query);

    // myApplication.showToast(
    //     text: response.data["message"],
    //     color: response.statusCode == 200 || response.statusCode == 201
    //         ? Colors.green
    //         : Colors.red);
    return response.data;
  }

  static Future<Response> postData(
      {required String url,
      required Map<String, dynamic> data,
      Map<String, dynamic>? query}) async {
    var response = await dio!.post(url, data: data, queryParameters: query);
    return response.data;
  }

  static Future<Response?> deleteData(
      {required String url, required Map<String, dynamic> query}) async {
    var response = await dio!.delete(url, queryParameters: query);

    // myApplication.showToast(
    //     text: response.data["message"],
    //     color: response.statusCode == 200 || response.statusCode == 201
    //         ? Colors.green
    //         : Colors.red);
    return response.data;
  }

  static Future<Response?> updateData(
      {required String url, required Map<String, dynamic> query}) async {
    var response = await dio!.patch(url, queryParameters: query);

    // myApplication.showToast(
    //     text: response.data["message"],
    //     color: response.statusCode == 200 || response.statusCode == 201
    //         ? Colors.green
    //         : Colors.red);
    return response.data;
  }
}
