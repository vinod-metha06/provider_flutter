import 'package:flutter/material.dart';
import 'package:provider_/Model/photo.dart';

import '../api/service.dart';

class Counter extends ChangeNotifier {
  final _service = Api();
  bool loading = false;

  List<Photos> _photos = [];
  get photos => _photos;

  List<Photos> _filtered = [];
  get filtered => _filtered;

  late Photos? _al = Photos();
  get al => _al;

  Future<void> getAllPhotos() async {
    loading = true;
    notifyListeners();

    _photos = await _service.getAll();

    loading = false;
    notifyListeners();
  }

  Future<void> getAl(id) async {
    _al = await _service.fetchAlbum(id);

    notifyListeners();
  }

  void filter(name) {
    _filtered = _photos
        .where((element) => element.title.toString().contains(name))
        .toList();
    notifyListeners();
  }
}
