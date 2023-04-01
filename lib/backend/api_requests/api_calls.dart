import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start JoBits POS Group Code

class JoBitsPOSGroup {
  static String baseUrl = 'http://[host]/jobits/';
  static Map<String, String> headers = {
    'Tennant': '[tennantToken]',
    'Authorization Bearer': '[bearerToken]',
  };
}

/// End JoBits POS Group Code

class GetTennantTokenCall {
  static Future<ApiCallResponse> call({
    String? host = '192.168.173.1:8080',
    int? idCuenta = 0,
    int? idBaseDatos = 0,
    String? basicToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getTennantToken',
      apiUrl:
          'http://${host}/jobits/tennant/cuenta/${idCuenta}/token-for/${idBaseDatos}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Basic ${basicToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DoAuthenticationCall {
  static Future<ApiCallResponse> call({
    String? host = '',
    String? tennantToken = '',
    String? basicToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'doAuthentication',
      apiUrl: 'http://${host}/jobits/pos/auth/basic',
      callType: ApiCallType.GET,
      headers: {
        'Tennant': '${tennantToken}',
        'Authorization': 'Basic ${basicToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetListaMesasDeAreaCall {
  static Future<ApiCallResponse> call({
    String? host = '',
    String? tennantToken = '',
    String? bearerToken = '',
    String? area = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getListaMesasDeArea',
      apiUrl: 'http://${host}/jobits/pos/area-venta/${area}/list-mesas',
      callType: ApiCallType.GET,
      headers: {
        'Tennant': '${tennantToken}',
        'Authorization': 'Bearer ${bearerToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GetListaAreaVentaCall {
  static Future<ApiCallResponse> call({
    String? host = '',
    String? tennantToken = '',
    String? bearerToken = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'getListaAreaVenta',
      apiUrl: 'http://${host}/jobits/pos/area-venta/list/names',
      callType: ApiCallType.GET,
      headers: {
        'Tennant': '${tennantToken}',
        'Authorization': 'Bearer ${bearerToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
