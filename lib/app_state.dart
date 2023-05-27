import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _monthlyspend = 0;
  int get monthlyspend => _monthlyspend;
  set monthlyspend(int _value) {
    _monthlyspend = _value;
  }

  String _searchstorename = '';
  String get searchstorename => _searchstorename;
  set searchstorename(String _value) {
    _searchstorename = _value;
  }

  String _status = '';
  String get status => _status;
  set status(String _value) {
    _status = _value;
  }

  String _nameprompt = '';
  String get nameprompt => _nameprompt;
  set nameprompt(String _value) {
    _nameprompt = _value;
  }

  double _total = 0.0;
  double get total => _total;
  set total(double _value) {
    _total = _value;
  }

  int _newscount = 0;
  int get newscount => _newscount;
  set newscount(int _value) {
    _newscount = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
