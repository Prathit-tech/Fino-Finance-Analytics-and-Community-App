import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'newsfeed_model.dart';
export 'newsfeed_model.dart';

class NewsfeedWidget extends StatefulWidget {
  const NewsfeedWidget({Key? key}) : super(key: key);

  @override
  _NewsfeedWidgetState createState() => _NewsfeedWidgetState();
}

class _NewsfeedWidgetState extends State<NewsfeedWidget> {
  late NewsfeedModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewsfeedModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Newsfeed'});
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Latest Business News',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FutureBuilder<ApiCallResponse>(
                  future: NewsauthCall.call(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      );
                    }
                    final swipeableStackNewsauthResponse = snapshot.data!;
                    return Builder(
                      builder: (context) {
                        final datalistlimit = NewsauthCall.datalist(
                              swipeableStackNewsauthResponse.jsonBody,
                            )?.toList() ??
                            [];
                        return FlutterFlowSwipeableStack(
                          topCardHeightFraction: 0.72,
                          middleCardHeightFraction: 0.68,
                          bottomCardHeightFraction: 0.75,
                          topCardWidthFraction: 0.9,
                          middleCardWidthFraction: 0.85,
                          bottomCardWidthFraction: 0.8,
                          onSwipeFn: (index) {},
                          onLeftSwipe: (index) async {
                            logFirebaseEvent(
                                'NEWSFEED_SwipeableStack_fiam27ty_ON_LEFT');
                            final datalistlimitItem = datalistlimit[index];
                            if (FFAppState().newscount < 24) {
                              logFirebaseEvent(
                                  'SwipeableStack_update_app_state');
                              setState(() {
                                FFAppState().newscount =
                                    FFAppState().newscount + 1;
                              });
                              return;
                            } else {
                              logFirebaseEvent(
                                  'SwipeableStack_update_app_state');
                              setState(() {
                                FFAppState().newscount = 2;
                              });
                              return;
                            }
                          },
                          onRightSwipe: (index) async {
                            logFirebaseEvent(
                                'NEWSFEED_SwipeableStack_fiam27ty_ON_RIGH');
                            final datalistlimitItem = datalistlimit[index];
                            if (FFAppState().newscount < 24) {
                              logFirebaseEvent(
                                  'SwipeableStack_update_app_state');
                              setState(() {
                                FFAppState().newscount =
                                    FFAppState().newscount + 1;
                              });
                              return;
                            } else {
                              logFirebaseEvent(
                                  'SwipeableStack_update_app_state');
                              setState(() {
                                FFAppState().newscount = 2;
                              });
                              return;
                            }
                          },
                          onUpSwipe: (index) async {
                            logFirebaseEvent(
                                'NEWSFEED_SwipeableStack_fiam27ty_ON_UP_S');
                            final datalistlimitItem = datalistlimit[index];
                            if (FFAppState().newscount < 24) {
                              logFirebaseEvent(
                                  'SwipeableStack_update_app_state');
                              setState(() {
                                FFAppState().newscount =
                                    FFAppState().newscount + 1;
                              });
                              return;
                            } else {
                              logFirebaseEvent(
                                  'SwipeableStack_update_app_state');
                              setState(() {
                                FFAppState().newscount = 2;
                              });
                              return;
                            }
                          },
                          onDownSwipe: (index) async {
                            logFirebaseEvent(
                                'NEWSFEED_SwipeableStack_fiam27ty_ON_DOWN');
                            final datalistlimitItem = datalistlimit[index];
                            if (FFAppState().newscount < 24) {
                              logFirebaseEvent(
                                  'SwipeableStack_update_app_state');
                              setState(() {
                                FFAppState().newscount =
                                    FFAppState().newscount + 1;
                              });
                              return;
                            } else {
                              logFirebaseEvent(
                                  'SwipeableStack_update_app_state');
                              setState(() {
                                FFAppState().newscount = 2;
                              });
                              return;
                            }
                          },
                          itemBuilder: (context, datalistlimitIndex) {
                            final datalistlimitItem =
                                datalistlimit[datalistlimitIndex];
                            return Container(
                              width: 100.0,
                              height: 169.1,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 30.0, 12.0, 0.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (NewsauthCall.image(
                                            swipeableStackNewsauthResponse
                                                .jsonBody,
                                          )[FFAppState().newscount] !=
                                          null)
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 20.0),
                                          child: CachedNetworkImage(
                                            imageUrl: NewsauthCall.image(
                                                      swipeableStackNewsauthResponse
                                                          .jsonBody,
                                                    )[FFAppState().newscount] ==
                                                    null
                                                ? 'https://picsum.photos/200'
                                                : NewsauthCall.image(
                                                    swipeableStackNewsauthResponse
                                                        .jsonBody,
                                                  )[FFAppState().newscount],
                                            width: 293.7,
                                            height: 230.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      Text(
                                        valueOrDefault<String>(
                                          (NewsauthCall.title(
                                            swipeableStackNewsauthResponse
                                                .jsonBody,
                                          ) as List)
                                              .map<String>((s) => s.toString())
                                              .toList()[FFAppState().newscount],
                                          '2',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white,
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            (NewsauthCall.description(
                                              swipeableStackNewsauthResponse
                                                  .jsonBody,
                                            ) as List)
                                                    .map<String>(
                                                        (s) => s.toString())
                                                    .toList()[
                                                FFAppState().newscount],
                                            '2',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .white,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 16.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'NEWSFEED_PAGE_Text_n55ontng_ON_TAP');
                                            logFirebaseEvent(
                                                'Text_launch_u_r_l');
                                            await launchURL((NewsauthCall.url(
                                              swipeableStackNewsauthResponse
                                                  .jsonBody,
                                            ) as List)
                                                    .map<String>(
                                                        (s) => s.toString())
                                                    .toList()[
                                                FFAppState().newscount]);
                                          },
                                          child: Text(
                                            'Url:',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFFF1F4F8),
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            logFirebaseEvent(
                                                'NEWSFEED_PAGE_Text_auooith8_ON_TAP');
                                            logFirebaseEvent(
                                                'Text_launch_u_r_l');
                                            await launchURL((NewsauthCall.url(
                                              swipeableStackNewsauthResponse
                                                  .jsonBody,
                                            ) as List)
                                                    .map<String>(
                                                        (s) => s.toString())
                                                    .toList()[
                                                FFAppState().newscount]);
                                          },
                                          child: Text(
                                            (NewsauthCall.url(
                                              swipeableStackNewsauthResponse
                                                  .jsonBody,
                                            ) as List)
                                                    .map<String>(
                                                        (s) => s.toString())
                                                    .toList()[
                                                FFAppState().newscount],
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  color: Color(0xFFF1F4F8),
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 18.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              (NewsauthCall.datetime(
                                                swipeableStackNewsauthResponse
                                                    .jsonBody,
                                              ) as List)
                                                      .map<String>(
                                                          (s) => s.toString())
                                                      .toList()[
                                                  FFAppState().newscount],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFFF1F4F8),
                                                      ),
                                            ),
                                            Text(
                                              (NewsauthCall.source(
                                                swipeableStackNewsauthResponse
                                                    .jsonBody,
                                              ) as List)
                                                      .map<String>(
                                                          (s) => s.toString())
                                                      .toList()[
                                                  FFAppState().newscount],
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFFF1F4F8),
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: datalistlimit.length,
                          controller: _model.swipeableStackController,
                          enableSwipeUp: true,
                          enableSwipeDown: true,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
