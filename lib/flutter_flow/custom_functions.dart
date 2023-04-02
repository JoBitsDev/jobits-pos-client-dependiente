import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

dynamic converTextFieldsToJson(
  String? nombre,
  String? host,
  int? idBaseDatos,
  int? idUsuario,
  String? usuario,
  String? password,
) {
  // convert text widgets to return a json
  return {
    'nombre': nombre,
    'host': host,
    'id_base_datos': idBaseDatos,
    'id_usuario': idUsuario,
    'usuario': usuario,
    'password': password,
  };
}

String? genereateBasicTokenFromUserAndPass(
  String? user,
  String? password,
) {
  // create a base64 credential
  String? basicAuth = 'Basic ' + base64Encode(utf8.encode('$user:$password'));
  return basicAuth;
}

String? splitBySpace(String stringToSplit) {
  // split a string by space and return first argument
  List<String> list = stringToSplit.split(' ');
  return list[0];
}
