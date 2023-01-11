import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:provider_/api/api.dart';

import '../Model/Car.dart';

class ApiProvider with ChangeNotifier {
  Api _api = Api();
  List<Car> _car = [];
  get car => _car;

  Future<void> getData() async {
    _car = await _api.getData();
    notifyListeners();
  }
}
