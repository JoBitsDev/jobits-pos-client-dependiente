import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _ubicaciones = prefs.getStringList('ff_ubicaciones')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        }).toList() ??
        _ubicaciones;
    if (prefs.containsKey('ff_ubicacion')) {
      try {
        _ubicacion = jsonDecode(prefs.getString('ff_ubicacion') ?? '');
      } catch (e) {
        print("Can't decode persisted json. Error: $e.");
      }
    }

    _version = prefs.getString('ff_version') ?? _version;
    _tennantHeader = prefs.getString('ff_tennantHeader') ?? _tennantHeader;
    _tokenHeader = prefs.getString('ff_tokenHeader') ?? _tokenHeader;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<dynamic> _ubicaciones = [jsonDecode('{}')];
  List<dynamic> get ubicaciones => _ubicaciones;
  set ubicaciones(List<dynamic> _value) {
    _ubicaciones = _value;
    prefs.setStringList(
        'ff_ubicaciones', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToUbicaciones(dynamic _value) {
    _ubicaciones.add(_value);
    prefs.setStringList(
        'ff_ubicaciones', _ubicaciones.map((x) => jsonEncode(x)).toList());
  }

  void removeFromUbicaciones(dynamic _value) {
    _ubicaciones.remove(_value);
    prefs.setStringList(
        'ff_ubicaciones', _ubicaciones.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromUbicaciones(int _index) {
    _ubicaciones.removeAt(_index);
    prefs.setStringList(
        'ff_ubicaciones', _ubicaciones.map((x) => jsonEncode(x)).toList());
  }

  dynamic _ubicacion = jsonDecode(
      '{\"nombre\":\"SERVIDOR\",\"host\":\"192.168.173.1:8080\",\"id_base_datos\":1,\"id_usuario\":1,\"usuario\":\"admin\",\"password\":\"1234\"}');
  dynamic get ubicacion => _ubicacion;
  set ubicacion(dynamic _value) {
    _ubicacion = _value;
    prefs.setString('ff_ubicacion', jsonEncode(_value));
  }

  String _version = 'v5.0.0';
  String get version => _version;
  set version(String _value) {
    _version = _value;
    prefs.setString('ff_version', _value);
  }

  String _tennantHeader = '';
  String get tennantHeader => _tennantHeader;
  set tennantHeader(String _value) {
    _tennantHeader = _value;
    prefs.setString('ff_tennantHeader', _value);
  }

  String _tokenHeader = '';
  String get tokenHeader => _tokenHeader;
  set tokenHeader(String _value) {
    _tokenHeader = _value;
    prefs.setString('ff_tokenHeader', _value);
  }

  String _estadoConexion = 'Sin Conexión';
  String get estadoConexion => _estadoConexion;
  set estadoConexion(String _value) {
    _estadoConexion = _value;
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
