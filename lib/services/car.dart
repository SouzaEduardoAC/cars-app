import 'dart:convert';

import 'package:carsapp/application_config.dart';
import 'package:carsapp/models/car.dart';
import 'package:http/http.dart' as http;

class CarService {
  static Future<List<Car>> getCars() async {
    final response = await http.get('$carsUrlBase/v1/carros');
    return mapCarsList(response);
  }

  static Future<List<Car>> _getCarsOf(String type) async {
    final response = await http.get('$carsUrlBase/v1/carros/tipo/$type');
    return mapCarsList(response);
  }

  static Future<List<Car>> getClassicCars() async {
    return await _getCarsOf('classicos');
  }

  static Future<List<Car>> getSportsCars() async {
    return await _getCarsOf('esportivos');
  }

  static Future<List<Car>> getLuxuryCars() async {
    return await _getCarsOf('luxo');
  }

  static mapCarsList(http.Response response) =>
      json.decode(response.body).map<Car>((c) => Car.fromJson(c)).toList();
}
