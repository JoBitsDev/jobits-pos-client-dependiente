import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'table_status_model.dart';
export 'table_status_model.dart';

class TableStatusWidget extends StatefulWidget {
  const TableStatusWidget({
    Key? key,
    String? areaSelected,
  })  : this.areaSelected = areaSelected ?? 'A-1',
        super(key: key);

  final String areaSelected;

  @override
  _TableStatusWidgetState createState() => _TableStatusWidgetState();
}

class _TableStatusWidgetState extends State<TableStatusWidget> {
  late TableStatusModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TableStatusModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).tertiary,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Estado de las mesas',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22.0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 60.0,
                              height: 60.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/icons8-male_user.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              FFAppState().loggedUser,
                              style: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 10.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        widget.areaSelected,
                        style: FlutterFlowTheme.of(context).headlineMedium,
                      ),
                      if (false)
                        ToggleIcon(
                          onPressed: () async {
                            setState(
                                () => _model.ordenadoPor = !_model.ordenadoPor);
                          },
                          value: _model.ordenadoPor,
                          onIcon: FaIcon(
                            FontAwesomeIcons.filter,
                            color: FlutterFlowTheme.of(context).success,
                            size: 30.0,
                          ),
                          offIcon: FaIcon(
                            FontAwesomeIcons.filter,
                            color: FlutterFlowTheme.of(context).alternate,
                            size: 30.0,
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                  child: FutureBuilder<ApiCallResponse>(
                    future: GetListaMesasDeAreaCall.call(
                      tennantToken: FFAppState().tennantToken,
                      host: getJsonField(
                        FFAppState().ubicacion,
                        r'''$.host''',
                      ).toString(),
                      area: widget.areaSelected,
                      bearerToken: FFAppState().bearerToken,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitFadingCube(
                              color: FlutterFlowTheme.of(context).primary,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      final listViewGetListaMesasDeAreaResponse =
                          snapshot.data!;
                      return Builder(
                        builder: (context) {
                          final listMesa = getJsonField(
                            listViewGetListaMesasDeAreaResponse.jsonBody,
                            r'''$''',
                          ).toList();
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listMesa.length,
                            itemBuilder: (context, listMesaIndex) {
                              final listMesaItem = listMesa[listMesaIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    3.0, 3.0, 3.0, 3.0),
                                child: Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 5.0, 5.0, 5.0),
                                    child: InkWell(
                                      onLongPress: () async {
                                        var _shouldSetState = false;
                                        if (getJsonField(
                                              listMesaItem,
                                              r'''$.estado''',
                                            ) !=
                                            'vacia') {
                                          _model.apiResultzsv =
                                              await OrdenValidateCall.call(
                                            host: getJsonField(
                                              FFAppState().ubicacion,
                                              r'''$.host''',
                                            ).toString(),
                                            tennantToken:
                                                FFAppState().tennantToken,
                                            bearerToken:
                                                FFAppState().bearerToken,
                                            codOrden: functions
                                                .splitBySpace(getJsonField(
                                              listMesaItem,
                                              r'''$.estado''',
                                            ).toString()),
                                          );
                                          _shouldSetState = true;
                                          if ((_model.apiResultzsv?.succeeded ??
                                              true)) {
                                            _model.apiResultek6 =
                                                await OrdenFindCall.call(
                                              host: getJsonField(
                                                FFAppState().ubicacion,
                                                r'''$.host''',
                                              ).toString(),
                                              tennantToken:
                                                  FFAppState().tennantToken,
                                              bearerToken:
                                                  FFAppState().bearerToken,
                                              codOrden: getJsonField(
                                                (_model.apiResultzsv
                                                        ?.jsonBody ??
                                                    ''),
                                                r'''$.codOrden''',
                                              ).toString(),
                                            );
                                            _shouldSetState = true;
                                            if ((_model
                                                    .apiResultek6?.succeeded ??
                                                true)) {
                                              context.pushNamed(
                                                'orderDetails',
                                                queryParams: {
                                                  'numeroOrden': serializeParam(
                                                    functions.splitBySpace(
                                                        getJsonField(
                                                      listMesaItem,
                                                      r'''$.estado''',
                                                    ).toString()),
                                                    ParamType.String,
                                                  ),
                                                  'orden': serializeParam(
                                                    (_model.apiResultek6
                                                            ?.jsonBody ??
                                                        ''),
                                                    ParamType.JSON,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    (_model.apiResultek6
                                                                ?.statusCode ??
                                                            200)
                                                        .toString(),
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                            }

                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  (_model.apiResultzsv
                                                              ?.statusCode ??
                                                          200)
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }
                                        } else {
                                          if (FFAppState().idVentaAbierta ==
                                              -1) {
                                            _model.apiResultcdu =
                                                await VentaResolveAbiertaCall
                                                    .call(
                                              host: getJsonField(
                                                FFAppState().ubicacion,
                                                r'''$.host''',
                                              ).toString(),
                                              tennantToken:
                                                  FFAppState().tennantToken,
                                              bearerToken:
                                                  FFAppState().bearerToken,
                                            );
                                            _shouldSetState = true;
                                            if ((_model
                                                    .apiResultcdu?.succeeded ??
                                                true)) {
                                              setState(() {
                                                FFAppState().idVentaAbierta =
                                                    getJsonField(
                                                  (_model.apiResultcdu
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.id''',
                                                );
                                              });
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    (_model.apiResultcdu
                                                                ?.statusCode ??
                                                            200)
                                                        .toString(),
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondary,
                                                ),
                                              );
                                              if (_shouldSetState)
                                                setState(() {});
                                              return;
                                            }
                                          }
                                          _model.apiResult3mm =
                                              await VentaCreateOrdenCall.call(
                                            host: getJsonField(
                                              FFAppState().ubicacion,
                                              r'''$.host''',
                                            ).toString(),
                                            tennantToken:
                                                FFAppState().tennantToken,
                                            bearerToken:
                                                FFAppState().bearerToken,
                                            id: FFAppState().idVentaAbierta,
                                            idMesa: functions
                                                .splitBySpace(getJsonField(
                                              listMesaItem,
                                              r'''$.estado''',
                                            ).toString()),
                                          );
                                          _shouldSetState = true;
                                          if ((_model.apiResult3mm?.succeeded ??
                                              true)) {
                                            context.pushNamed(
                                              'orderDetails',
                                              queryParams: {
                                                'numeroOrden': serializeParam(
                                                  getJsonField(
                                                    (_model.apiResult3mm
                                                            ?.jsonBody ??
                                                        ''),
                                                    r'''$.codOrden''',
                                                  ).toString(),
                                                  ParamType.String,
                                                ),
                                                'orden': serializeParam(
                                                  (_model.apiResult3mm
                                                          ?.jsonBody ??
                                                      ''),
                                                  ParamType.JSON,
                                                ),
                                              }.withoutNulls,
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  (_model.apiResult3mm
                                                              ?.statusCode ??
                                                          200)
                                                      .toString(),
                                                  style: TextStyle(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                  ),
                                                ),
                                                duration: Duration(
                                                    milliseconds: 4000),
                                                backgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                              ),
                                            );
                                          }

                                          if (_shouldSetState) setState(() {});
                                          return;
                                        }

                                        if (_shouldSetState) setState(() {});
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            valueOrDefault<String>(
                                              getJsonField(
                                                listMesaItem,
                                                r'''$.codMesa''',
                                              ).toString(),
                                              '<Codigo-Mesa>',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .headlineMedium,
                                          ),
                                          Text(
                                            valueOrDefault<String>(
                                              getJsonField(
                                                listMesaItem,
                                                r'''$.estado''',
                                              ).toString(),
                                              '<Estado>',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Color(0x00EEEEEE),
                    ),
                    child: Image.asset(
                      'assets/images/JOBITS_Recurso_5@x.png',
                      width: 20.0,
                      height: 20.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
