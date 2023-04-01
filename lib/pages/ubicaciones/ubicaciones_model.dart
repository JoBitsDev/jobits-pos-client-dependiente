import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UbicacionesModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for nombre widget.
  TextEditingController? nombreController;
  String? Function(BuildContext, String?)? nombreControllerValidator;
  // State field(s) for url widget.
  TextEditingController? urlController;
  String? Function(BuildContext, String?)? urlControllerValidator;
  // State field(s) for idBaseDatos widget.
  TextEditingController? idBaseDatosController;
  String? Function(BuildContext, String?)? idBaseDatosControllerValidator;
  // State field(s) for idUsuario widget.
  TextEditingController? idUsuarioController;
  String? Function(BuildContext, String?)? idUsuarioControllerValidator;
  // State field(s) for usuario widget.
  TextEditingController? usuarioController;
  String? Function(BuildContext, String?)? usuarioControllerValidator;
  // State field(s) for password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // Stores action output result for [Backend Call - API (getTennantToken)] action in Button widget.
  ApiCallResponse? tennantResponse;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  void dispose() {
    nombreController?.dispose();
    urlController?.dispose();
    idBaseDatosController?.dispose();
    idUsuarioController?.dispose();
    usuarioController?.dispose();
    passwordController?.dispose();
  }

  /// Additional helper methods are added here.

}
