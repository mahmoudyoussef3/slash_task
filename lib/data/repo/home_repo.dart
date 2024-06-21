import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/home_model.dart';

class HomeRepository {
  Future<Map<String, List<HomeModel>>> fetchHomeData() async {
    final response = await rootBundle.loadString('assets/dummyData.json');
    final Map<String, dynamic> data = json.decode(response);
    return {
      'bestSelling': (data['bestSelling'] as List).map((e) => HomeModel.fromJson(e)).toList(),
      'newArrival': (data['newArrival'] as List).map((e) => HomeModel.fromJson(e)).toList(),
      'recommendedForYou': (data['recommendedForYou'] as List).map((e) => HomeModel.fromJson(e)).toList(),
    };
  }
}
