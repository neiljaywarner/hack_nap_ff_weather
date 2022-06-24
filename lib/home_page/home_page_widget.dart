import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  Completer<ApiCallResponse> _apiRequestCompleter;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: AutoSizeText(
          'Unofficial Hot Popular Cities List DEMO\nwww.timeanddate.com/weather/',
          style: FlutterFlowTheme.of(context).bodyText2.override(
                fontFamily: 'Poppins',
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FutureBuilder<ApiCallResponse>(
                future: (_apiRequestCompleter ??= Completer<ApiCallResponse>()
                      ..complete(
                          AboutPmHotMostPopularCitiesFromTimeanddatecomSlashWeatherCall
                              .call()))
                    .future,
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  final listViewAboutPmHotMostPopularCitiesFromTimeanddatecomSlashWeatherResponse =
                      snapshot.data;
                  return Builder(
                    builder: (context) {
                      final cities = (getJsonField(
                                (listViewAboutPmHotMostPopularCitiesFromTimeanddatecomSlashWeatherResponse
                                        ?.jsonBody ??
                                    ''),
                                r'''$''',
                              )?.toList() ??
                              [])
                          .take(100)
                          .toList();
                      return CustomRefreshIndicator(
                        onRefresh: () async {
                          setState(() => _apiRequestCompleter = null);
                          await waitForApiRequestCompleter();
                        },
                        onStateChanged: (c) =>
                            c.didChange(from: IndicatorState.loading)
                                ? setState(() {})
                                : null,
                        builder: (context, child, controller) => Stack(
                          children: [
                            if (controller.isLoading)
                              Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: 50,
                                  child: Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: controller.isLoading ? 50 : 0.0,
                              ),
                              child: child,
                            ),
                          ],
                        ),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: cities.length,
                          itemBuilder: (context, citiesIndex) {
                            final citiesItem = cities[citiesIndex];
                            return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    color: Color(0x2E000000),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Color(0xFFF1F4F8),
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 12, 12, 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                getJsonField(
                                                  citiesItem,
                                                  r'''$.city''',
                                                ).toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF090F13),
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 4, 0),
                                                    child: Text(
                                                      functions
                                                          .addOne(citiesIndex),
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .title2
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Color(
                                                                0xFF090F13),
                                                            fontSize: 22,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 0, 12, 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: AutoSizeText(
                                              getJsonField(
                                                citiesItem,
                                                r'''$.farenheit''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF090F13),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future waitForApiRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
