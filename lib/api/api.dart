import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:provider_/Model/Car.dart';

class Api {
  Future<List<Car>> getData() async {
    List<Car> car = [];

    final res = await http.get(Uri.parse("uri"));

    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);

      return json
          .map((data) {
            Car.fromJson(data);
          })
          .cast<Car>()
          .toList();
    } else {
      return car;

      throw Exception("Failed to load data");
    }
  }
}
