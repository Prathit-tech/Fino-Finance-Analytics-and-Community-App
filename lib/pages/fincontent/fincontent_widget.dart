import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/createpost/createpost_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'fincontent_model.dart';
export 'fincontent_model.dart';

class FincontentWidget extends StatefulWidget {
  const FincontentWidget({Key? key}) : super(key: key);

  @override
  _FincontentWidgetState createState() => _FincontentWidgetState();
}

class _FincontentWidgetState extends State<FincontentWidget> {
  late FincontentModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FincontentModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'fincontent'});
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
        backgroundColor: FlutterFlowTheme.of(context).primary,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print('FloatingActionButton pressed ...');
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 15.0,
          child: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            fillColor: FlutterFlowTheme.of(context).secondary,
            icon: Icon(
              Icons.add,
              color: FlutterFlowTheme.of(context).white,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('FINCONTENT_PAGE_add_ICN_ON_TAP');
              logFirebaseEvent('IconButton_bottom_sheet');
              await showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                enableDrag: false,
                context: context,
                builder: (bottomSheetContext) {
                  return GestureDetector(
                    onTap: () =>
                        FocusScope.of(context).requestFocus(_unfocusNode),
                    child: Padding(
                      padding: MediaQuery.of(bottomSheetContext).viewInsets,
                      child: CreatepostWidget(),
                    ),
                  );
                },
              ).then((value) => setState(() {}));
            },
          ),
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: StreamBuilder<List<PostsRecord>>(
                  stream: queryPostsRecord(
                    queryBuilder: (postsRecord) => postsRecord
                        .orderBy('time_posted', descending: true)
                        .orderBy('num_votes', descending: true),
                  ),
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
                    List<PostsRecord> swipeableStackPostsRecordList =
                        snapshot.data!;
                    return FlutterFlowSwipeableStack(
                      topCardHeightFraction: 0.72,
                      middleCardHeightFraction: 0.68,
                      bottomCardHeightFraction: 0.75,
                      topCardWidthFraction: 0.9,
                      middleCardWidthFraction: 0.85,
                      bottomCardWidthFraction: 0.8,
                      onSwipeFn: (index) {},
                      onLeftSwipe: (index) {},
                      onRightSwipe: (index) {},
                      onUpSwipe: (index) {},
                      onDownSwipe: (index) {},
                      itemBuilder: (context, swipeableStackIndex) {
                        final swipeableStackPostsRecord =
                            swipeableStackPostsRecordList[swipeableStackIndex];
                        return Material(
                          color: Colors.transparent,
                          elevation: 8.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Container(
                            width: 356.0,
                            height: 602.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFFDFCF9),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 8.0),
                                  child: Text(
                                    swipeableStackPostsRecord.postTitle,
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Color(0xBF060505),
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 8.0, 8.0, 8.0),
                                  child: Text(
                                    swipeableStackPostsRecord.postDescription,
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Color(0xBF060505),
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Text(
                                  dateTimeFormat(
                                    'yMMMd',
                                    swipeableStackPostsRecord.timePosted!,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xBF060505),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Text(
                                  swipeableStackPostsRecord.numVotes.toString(),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    FlutterFlowIconButton(
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: 20.0,
                                      borderWidth: 0.0,
                                      buttonSize: 50.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).white,
                                      icon: Icon(
                                        Icons.thumb_down_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'FINCONTENT_thumb_down_sharp_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_backend_call');

                                        final postsUpdateData = {
                                          'num_votes':
                                              FieldValue.increment(-(1)),
                                        };
                                        await swipeableStackPostsRecord
                                            .reference
                                            .update(postsUpdateData);
                                        logFirebaseEvent(
                                            'IconButton_swipeable_stack');
                                        _model.swipeableStackController
                                            .triggerSwipeLeft();
                                      },
                                    ),
                                    FlutterFlowIconButton(
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderRadius: 20.0,
                                      borderWidth: 0.0,
                                      buttonSize: 50.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).white,
                                      icon: Icon(
                                        Icons.thumb_up_alt,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'FINCONTENT_PAGE_thumb_up_alt_ICN_ON_TAP');
                                        logFirebaseEvent(
                                            'IconButton_backend_call');

                                        final postsUpdateData = {
                                          'num_votes': FieldValue.increment(1),
                                        };
                                        await swipeableStackPostsRecord
                                            .reference
                                            .update(postsUpdateData);
                                        logFirebaseEvent(
                                            'IconButton_swipeable_stack');
                                        _model.swipeableStackController
                                            .triggerSwipeRight();
                                      },
                                    ),
                                  ],
                                ),
                                Builder(
                                  builder: (context) => FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 60.0,
                                    icon: Icon(
                                      Icons.share_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'FINCONTENT_PAGE_share_sharp_ICN_ON_TAP');
                                      logFirebaseEvent('IconButton_share');
                                      await Share.share(
                                        'On the Fino App someone said \'${swipeableStackPostsRecord.postTitle}\'',
                                        sharePositionOrigin:
                                            getWidgetBoundingBox(context),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: swipeableStackPostsRecordList.length,
                      controller: _model.swipeableStackController,
                      enableSwipeUp: false,
                      enableSwipeDown: false,
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
