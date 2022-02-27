import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:renta/services/api_service.dart';
import 'package:renta/widgets/data.dart';

class CarsDataProvider extends ChangeNotifier {
  Map<String, List<Car>> _cars = {};

  Map<String, List<Car>> get cars => _cars;

  bool isEmpty() => _cars.isEmpty;

  Future<bool> fetchData() async {
    var res = await APIService.fetchCars();
    // print('RES: ' + res.body);
    Map<String, List<Car>> cars = {};
    if (res.statusCode == 200 || res.statusCode == 400) {
      var data = jsonDecode(res.body);
      data['data']['cars'].forEach((car) {
        // print(car);
        if (cars[car['category']] == null) {
          cars[car['category']] = [];
        }
        cars[car['category']]!.add(Car.fromJson(car));
        // print('done');
      });
    }
    // print('object');
    _cars = cars;
    // print('cars:' + cars.toString());
    notifyListeners();
    return true;
  }
}
