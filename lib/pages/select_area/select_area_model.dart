import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/table_status/table_status_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectAreaModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<dynamic> listaAreas = [];
  void addToListaAreas(dynamic item) => listaAreas.add(item);
  void removeFromListaAreas(dynamic item) => listaAreas.remove(item);
  void removeAtIndexFromListaAreas(int index) => listaAreas.removeAt(index);

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
