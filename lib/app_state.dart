import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
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
    secureStorage = FlutterSecureStorage();
    _ubicaciones =
        (await secureStorage.getStringList('ff_ubicaciones'))?.map((x) {
              try {
                return jsonDecode(x);
              } catch (e) {
                print("Can't decode persisted json. Error: $e.");
                return {};
              }
            }).toList() ??
            _ubicaciones;
    if (await secureStorage.read(key: 'ff_ubicacion') != null) {
      try {
        _ubicacion =
            jsonDecode(await secureStorage.getString('ff_ubicacion') ?? '');
      } catch (e) {
        print("Can't decode persisted json. Error: $e.");
      }
    }

    _version = await secureStorage.getString('ff_version') ?? _version;
    _tennantToken =
        await secureStorage.getString('ff_tennantToken') ?? _tennantToken;
    _bearerToken =
        await secureStorage.getString('ff_bearerToken') ?? _bearerToken;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<dynamic> _ubicaciones = [jsonDecode('{}')];
  List<dynamic> get ubicaciones => _ubicaciones;
  set ubicaciones(List<dynamic> _value) {
    _ubicaciones = _value;
    secureStorage.setStringList(
        'ff_ubicaciones', _value.map((x) => jsonEncode(x)).toList());
  }

  void deleteUbicaciones() {
    secureStorage.delete(key: 'ff_ubicaciones');
  }

  void addToUbicaciones(dynamic _value) {
    _ubicaciones.add(_value);
    secureStorage.setStringList(
        'ff_ubicaciones', _ubicaciones.map((x) => jsonEncode(x)).toList());
  }

  void removeFromUbicaciones(dynamic _value) {
    _ubicaciones.remove(_value);
    secureStorage.setStringList(
        'ff_ubicaciones', _ubicaciones.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromUbicaciones(int _index) {
    _ubicaciones.removeAt(_index);
    secureStorage.setStringList(
        'ff_ubicaciones', _ubicaciones.map((x) => jsonEncode(x)).toList());
  }

  dynamic _ubicacion = jsonDecode(
      '{\"nombre\":\"SERVIDOR\",\"host\":\"192.168.173.1:8080\",\"idBaseDatos\":1,\"idUsuario\":1,\"usuario\":\"admin\",\"password\":\"1234\"}');
  dynamic get ubicacion => _ubicacion;
  set ubicacion(dynamic _value) {
    _ubicacion = _value;
    secureStorage.setString('ff_ubicacion', jsonEncode(_value));
  }

  void deleteUbicacion() {
    secureStorage.delete(key: 'ff_ubicacion');
  }

  String _version = 'v5.0.0';
  String get version => _version;
  set version(String _value) {
    _version = _value;
    secureStorage.setString('ff_version', _value);
  }

  void deleteVersion() {
    secureStorage.delete(key: 'ff_version');
  }

  String _estadoConexion = 'Sin Conexión';
  String get estadoConexion => _estadoConexion;
  set estadoConexion(String _value) {
    _estadoConexion = _value;
  }

  String _tennantToken = '';
  String get tennantToken => _tennantToken;
  set tennantToken(String _value) {
    _tennantToken = _value;
    secureStorage.setString('ff_tennantToken', _value);
  }

  void deleteTennantToken() {
    secureStorage.delete(key: 'ff_tennantToken');
  }

  String _bearerToken = '';
  String get bearerToken => _bearerToken;
  set bearerToken(String _value) {
    _bearerToken = _value;
    secureStorage.setString('ff_bearerToken', _value);
  }

  void deleteBearerToken() {
    secureStorage.delete(key: 'ff_bearerToken');
  }

  String _loggedUser = '';
  String get loggedUser => _loggedUser;
  set loggedUser(String _value) {
    _loggedUser = _value;
  }

  int _idVentaAbierta = -1;
  int get idVentaAbierta => _idVentaAbierta;
  set idVentaAbierta(int _value) {
    _idVentaAbierta = _value;
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await write(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await write(key: key, value: ListToCsvConverter().convert([value]));
}
