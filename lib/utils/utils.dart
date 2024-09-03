import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

Dio dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:8000/api/v1"));

Color? getCategoryItemColor(int index) {
  switch (index) {
    case 0:
      return Colors.red;
    case 1:
      return Colors.green;
    case 2:
      return Colors.orange;
    case 3:
      return Colors.deepOrange;
    case 4:
      return Colors.purple;
    case 5:
      return Colors.blue;
    case 6:
      return Colors.deepOrange;
    default:
      return null;
  }
}
