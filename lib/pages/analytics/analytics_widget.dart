import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'analytics_model.dart';
export 'analytics_model.dart';

class AnalyticsWidget extends StatefulWidget {
  const AnalyticsWidget({Key? key}) : super(key: key);

  @override
  _AnalyticsWidgetState createState() => _AnalyticsWidgetState();
}

class _AnalyticsWidgetState extends State<AnalyticsWidget> {
  late AnalyticsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnalyticsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Analytics'});
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primary,
        automaticallyImplyLeading: false,
        title: Text(
          'Monthly Report',
          style: FlutterFlowTheme.of(context).displaySmall.override(
                fontFamily: 'Outfit',
                color: FlutterFlowTheme.of(context).white,
                fontSize: 30.0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 1290.0,
                height: 1004.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'ANALYTICS_CLICK_TO_CALCULATE_TOTAL_BTN_O');
                            logFirebaseEvent('Button_custom_action');
                            _model.total = await actions.totalamount(
                              currentUserDisplayName,
                            );
                            logFirebaseEvent('Button_custom_action');
                            _model.received = await actions.totalamountreceived(
                              currentUserDisplayName,
                            );
                            logFirebaseEvent('Button_custom_action');
                            _model.sent = await actions.totalamountsent(
                              currentUserDisplayName,
                            );

                            setState(() {});
                          },
                          text: 'Click to calculate total',
                          options: FFButtonOptions(
                            width: 180.0,
                            height: 30.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Outfit',
                                  color: Colors.white,
                                ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      Container(
                        width: 391.5,
                        height: 138.6,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Net total',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 20.0,
                                      ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    _model.total?.toString(),
                                    '0.0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 18.0,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Total Spent',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 20.0,
                                      ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    _model.sent?.toString(),
                                    '0.0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 18.0,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Total Received',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 20.0,
                                      ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    _model.received?.toString(),
                                    '0.0',
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Outfit',
                                        fontSize: 18.0,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 18.0, 0.0, 12.0),
                        child: AuthUserStreamWidget(
                          builder: (context) =>
                              StreamBuilder<List<TransactionRecord>>(
                            stream: queryTransactionRecord(
                              queryBuilder: (transactionRecord) =>
                                  transactionRecord
                                      .where('name',
                                          isEqualTo: currentUserDisplayName)
                                      .where('status', isEqualTo: 'sent')
                                      .orderBy('created_at'),
                              limit: 10,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                );
                              }
                              List<TransactionRecord>
                                  chartTransactionRecordList = snapshot.data!;
                              return Container(
                                width: 360.0,
                                height: 180.0,
                                child: FlutterFlowLineChart(
                                  data: [
                                    FFLineChartData(
                                      xData: chartTransactionRecordList
                                          .map((d) => d.createdAt)
                                          .toList(),
                                      yData: chartTransactionRecordList
                                          .map((d) => d.amount)
                                          .toList(),
                                      settings: LineChartBarData(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        barWidth: 3.0,
                                        belowBarData: BarAreaData(
                                          show: true,
                                          color: Color(0xBC085EB6),
                                        ),
                                      ),
                                    )
                                  ],
                                  chartStylingInfo: ChartStylingInfo(
                                    enableTooltip: true,
                                    tooltipBackgroundColor: Color(0xFF101213),
                                    backgroundColor: Colors.white,
                                    showGrid: true,
                                    showBorder: false,
                                  ),
                                  axisBounds: AxisBounds(),
                                  xAxisLabelInfo: AxisLabelInfo(
                                    title: 'Time',
                                    titleTextStyle: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  yAxisLabelInfo: AxisLabelInfo(
                                    title: 'Amount',
                                    titleTextStyle: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(1.0, 1.0, 1.0, 1.0),
                        child: Container(
                          width: 334.0,
                          height: 178.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  6.0, 6.0, 6.0, 6.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 15.0),
                                      child: Text(
                                        'Transactions Sent',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Maximum Payment Sent',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFFF1F4F8),
                                                        fontSize: 14.0,
                                                      ),
                                            ),
                                          ),
                                          Expanded(
                                            child: AuthUserStreamWidget(
                                              builder: (context) =>
                                                  StreamBuilder<
                                                      List<TransactionRecord>>(
                                                stream: queryTransactionRecord(
                                                  queryBuilder:
                                                      (transactionRecord) =>
                                                          transactionRecord
                                                              .where('name',
                                                                  isEqualTo:
                                                                      currentUserDisplayName)
                                                              .where('status',
                                                                  isEqualTo:
                                                                      'sent')
                                                              .orderBy('amount',
                                                                  descending:
                                                                      true),
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<TransactionRecord>
                                                      textTransactionRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final textTransactionRecord =
                                                      textTransactionRecordList
                                                              .isNotEmpty
                                                          ? textTransactionRecordList
                                                              .first
                                                          : null;
                                                  return Text(
                                                    valueOrDefault<String>(
                                                      formatNumber(
                                                        textTransactionRecord!
                                                            .amount,
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .automatic,
                                                      ),
                                                      'Add transactions by clicking Continue',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFFF1F4F8),
                                                          fontSize: 16.0,
                                                        ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Minimum Payment Sent',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFFF1F4F8),
                                                        fontSize: 14.0,
                                                      ),
                                            ),
                                          ),
                                          Expanded(
                                            child: AuthUserStreamWidget(
                                              builder: (context) =>
                                                  StreamBuilder<
                                                      List<TransactionRecord>>(
                                                stream: queryTransactionRecord(
                                                  queryBuilder:
                                                      (transactionRecord) =>
                                                          transactionRecord
                                                              .where('name',
                                                                  isEqualTo:
                                                                      currentUserDisplayName)
                                                              .where('status',
                                                                  isEqualTo:
                                                                      'sent')
                                                              .orderBy(
                                                                  'amount'),
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<TransactionRecord>
                                                      textTransactionRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final textTransactionRecord =
                                                      textTransactionRecordList
                                                              .isNotEmpty
                                                          ? textTransactionRecordList
                                                              .first
                                                          : null;
                                                  return Text(
                                                    valueOrDefault<String>(
                                                      formatNumber(
                                                        textTransactionRecord!
                                                            .amount,
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .automatic,
                                                      ),
                                                      'Add transactions by clicking Continue',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFFF1F4F8),
                                                          fontSize: 16.0,
                                                        ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Container(
                          width: 338.0,
                          height: 178.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primary,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  6.0, 6.0, 6.0, 6.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 15.0),
                                      child: Text(
                                        'Transactions Received',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .white,
                                              fontSize: 22.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Maximum Payment Received',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFFF1F4F8),
                                                        fontSize: 14.0,
                                                      ),
                                            ),
                                          ),
                                          Expanded(
                                            child: AuthUserStreamWidget(
                                              builder: (context) =>
                                                  StreamBuilder<
                                                      List<TransactionRecord>>(
                                                stream: queryTransactionRecord(
                                                  queryBuilder:
                                                      (transactionRecord) =>
                                                          transactionRecord
                                                              .where('name',
                                                                  isEqualTo:
                                                                      currentUserDisplayName)
                                                              .where(
                                                                  'status',
                                                                  isEqualTo:
                                                                      'received')
                                                              .orderBy('amount',
                                                                  descending:
                                                                      true),
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<TransactionRecord>
                                                      textTransactionRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final textTransactionRecord =
                                                      textTransactionRecordList
                                                              .isNotEmpty
                                                          ? textTransactionRecordList
                                                              .first
                                                          : null;
                                                  return Text(
                                                    valueOrDefault<String>(
                                                      formatNumber(
                                                        textTransactionRecord!
                                                            .amount,
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .automatic,
                                                      ),
                                                      'Add transactions by clicking Continue',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFFF1F4F8),
                                                          fontSize: 16.0,
                                                        ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 8.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              'Minimum Payment Received',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFFF1F4F8),
                                                        fontSize: 14.0,
                                                      ),
                                            ),
                                          ),
                                          Expanded(
                                            child: AuthUserStreamWidget(
                                              builder: (context) =>
                                                  StreamBuilder<
                                                      List<TransactionRecord>>(
                                                stream: queryTransactionRecord(
                                                  queryBuilder:
                                                      (transactionRecord) =>
                                                          transactionRecord
                                                              .where(
                                                                  'name',
                                                                  isEqualTo:
                                                                      currentUserDisplayName)
                                                              .where(
                                                                  'status',
                                                                  isEqualTo:
                                                                      'received')
                                                              .orderBy(
                                                                  'amount'),
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<TransactionRecord>
                                                      textTransactionRecordList =
                                                      snapshot.data!;
                                                  // Return an empty Container when the item does not exist.
                                                  if (snapshot.data!.isEmpty) {
                                                    return Container();
                                                  }
                                                  final textTransactionRecord =
                                                      textTransactionRecordList
                                                              .isNotEmpty
                                                          ? textTransactionRecordList
                                                              .first
                                                          : null;
                                                  return Text(
                                                    valueOrDefault<String>(
                                                      formatNumber(
                                                        textTransactionRecord!
                                                            .amount,
                                                        formatType:
                                                            FormatType.decimal,
                                                        decimalType: DecimalType
                                                            .automatic,
                                                      ),
                                                      'Add transactions by clicking Continue',
                                                    ),
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .displaySmall
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFFF1F4F8),
                                                          fontSize: 16.0,
                                                        ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
