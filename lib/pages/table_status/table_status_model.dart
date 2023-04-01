import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TableStatusModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool ordenadoPor = false;

  List<dynamic> listaMesas = [];
  void addToListaMesas(dynamic item) => listaMesas.add(item);
  void removeFromListaMesas(dynamic item) => listaMesas.remove(item);
  void removeAtIndexFromListaMesas(int index) => listaMesas.removeAt(index);

  ///  State fields for stateful widgets in this page.

  // State field(s) for Switch widget.
  bool? switchValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Additional helper methods are added here.

}
