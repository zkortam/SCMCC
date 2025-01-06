import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.dark);
      _model.queryMusalla = await queryPrayerInformationRecordOnce(
        queryBuilder: (prayerInformationRecord) =>
            prayerInformationRecord.where(
          'Musalla',
          isEqualTo: 'Silver Creek',
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      _model.apiResulttm3 = await PrayerTimeCall.call();

      if ((_model.apiResulttm3?.succeeded ?? true)) {
        await _model.queryMusalla!.reference
            .update(createPrayerInformationRecordData(
          maghribTime:
              functions.convertTimeStringToDateTime(PrayerTimeCall.maghrib(
            (_model.apiResulttm3?.jsonBody ?? ''),
          )!),
        ));
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: StreamBuilder<List<PrayerInformationRecord>>(
                stream: queryPrayerInformationRecord(
                  queryBuilder: (prayerInformationRecord) =>
                      prayerInformationRecord.where(
                    'Musalla',
                    isEqualTo: 'Silver Creek',
                  ),
                  singleRecord: true,
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: SpinKitRipple(
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 50.0,
                        ),
                      ),
                    );
                  }
                  List<PrayerInformationRecord>
                      columnPrayerInformationRecordList = snapshot.data!;
                  // Return an empty Container when the item does not exist.
                  if (snapshot.data!.isEmpty) {
                    return Container();
                  }
                  final columnPrayerInformationRecord =
                      columnPrayerInformationRecordList.isNotEmpty
                          ? columnPrayerInformationRecordList.first
                          : null;

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 10.0, 0.0, 10.0),
                        child: Container(
                          width: double.infinity,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: const Color(0x8D179A86),
                            borderRadius: BorderRadius.circular(40.0),
                            border: Border.all(
                              color: Colors.transparent,
                              width: 0.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'or7lt7lc' /* Iqama Times */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(40.0),
                            border: Border.all(
                              color: valueOrDefault<Color>(
                                functions.getNextPrayer(
                                            getCurrentTimestamp,
                                            columnPrayerInformationRecord!
                                                .fajrTime!,
                                            columnPrayerInformationRecord
                                                .duhrTIme!,
                                            columnPrayerInformationRecord
                                                .asrTime!,
                                            columnPrayerInformationRecord
                                                .maghribTime!,
                                            columnPrayerInformationRecord
                                                .ishaTime!,
                                            columnPrayerInformationRecord
                                                .jumaaTime!) ==
                                        'fajr'
                                    ? FlutterFlowTheme.of(context).primaryText
                                    : FlutterFlowTheme.of(context).alternate,
                                FlutterFlowTheme.of(context).alternate,
                              ),
                              width: 3.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'wkxax5wy' /* Fajr */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  dateTimeFormat(
                                    "jm",
                                    columnPrayerInformationRecord.fajrTime!,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(40.0),
                            border: Border.all(
                              color: valueOrDefault<Color>(
                                functions.getNextPrayer(
                                            getCurrentTimestamp,
                                            columnPrayerInformationRecord
                                                .fajrTime!,
                                            columnPrayerInformationRecord
                                                .duhrTIme!,
                                            columnPrayerInformationRecord
                                                .asrTime!,
                                            columnPrayerInformationRecord
                                                .maghribTime!,
                                            columnPrayerInformationRecord
                                                .ishaTime!,
                                            columnPrayerInformationRecord
                                                .jumaaTime!) ==
                                        'duhr'
                                    ? FlutterFlowTheme.of(context).primaryText
                                    : FlutterFlowTheme.of(context).alternate,
                                FlutterFlowTheme.of(context).alternate,
                              ),
                              width: 3.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'byj5gjsa' /* Duhur */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  dateTimeFormat(
                                    "jm",
                                    columnPrayerInformationRecord.duhrTIme!,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(40.0),
                            border: Border.all(
                              color: valueOrDefault<Color>(
                                functions.getNextPrayer(
                                            getCurrentTimestamp,
                                            columnPrayerInformationRecord
                                                .fajrTime!,
                                            columnPrayerInformationRecord
                                                .duhrTIme!,
                                            columnPrayerInformationRecord
                                                .asrTime!,
                                            columnPrayerInformationRecord
                                                .maghribTime!,
                                            columnPrayerInformationRecord
                                                .ishaTime!,
                                            columnPrayerInformationRecord
                                                .jumaaTime!) ==
                                        'asr'
                                    ? FlutterFlowTheme.of(context).primaryText
                                    : FlutterFlowTheme.of(context).alternate,
                                FlutterFlowTheme.of(context).alternate,
                              ),
                              width: 3.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '0kila3kh' /* Asr */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  dateTimeFormat(
                                    "jm",
                                    columnPrayerInformationRecord.asrTime!,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(40.0),
                            border: Border.all(
                              color: valueOrDefault<Color>(
                                functions.getNextPrayer(
                                            getCurrentTimestamp,
                                            columnPrayerInformationRecord
                                                .fajrTime!,
                                            columnPrayerInformationRecord
                                                .duhrTIme!,
                                            columnPrayerInformationRecord
                                                .asrTime!,
                                            columnPrayerInformationRecord
                                                .maghribTime!,
                                            columnPrayerInformationRecord
                                                .ishaTime!,
                                            columnPrayerInformationRecord
                                                .jumaaTime!) ==
                                        'maghrib'
                                    ? FlutterFlowTheme.of(context).primaryText
                                    : FlutterFlowTheme.of(context).alternate,
                                FlutterFlowTheme.of(context).alternate,
                              ),
                              width: 3.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '75u3c5pb' /* Maghrib */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  dateTimeFormat(
                                    "jm",
                                    columnPrayerInformationRecord.maghribTime!,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: Container(
                          width: double.infinity,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(40.0),
                            border: Border.all(
                              color: valueOrDefault<Color>(
                                functions.getNextPrayer(
                                            getCurrentTimestamp,
                                            columnPrayerInformationRecord
                                                .fajrTime!,
                                            columnPrayerInformationRecord
                                                .duhrTIme!,
                                            columnPrayerInformationRecord
                                                .asrTime!,
                                            columnPrayerInformationRecord
                                                .maghribTime!,
                                            columnPrayerInformationRecord
                                                .ishaTime!,
                                            columnPrayerInformationRecord
                                                .jumaaTime!) ==
                                        'isha'
                                    ? FlutterFlowTheme.of(context).primaryText
                                    : FlutterFlowTheme.of(context).alternate,
                                FlutterFlowTheme.of(context).alternate,
                              ),
                              width: 3.0,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '7tee94gy' /* Isha */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Text(
                                  dateTimeFormat(
                                    "jm",
                                    columnPrayerInformationRecord.ishaTime!,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 130.0,
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 130.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.asset(
                                    'assets/images/photo-1638272181967-7d3772a91265.jpeg',
                                  ).image,
                                ),
                                borderRadius: BorderRadius.circular(40.0),
                                border: Border.all(
                                  color: valueOrDefault<Color>(
                                    functions.getNextPrayer(
                                                getCurrentTimestamp,
                                                columnPrayerInformationRecord
                                                    .fajrTime!,
                                                columnPrayerInformationRecord
                                                    .duhrTIme!,
                                                columnPrayerInformationRecord
                                                    .asrTime!,
                                                columnPrayerInformationRecord
                                                    .maghribTime!,
                                                columnPrayerInformationRecord
                                                    .ishaTime!,
                                                columnPrayerInformationRecord
                                                    .jumaaTime!) ==
                                            'Jumaa'
                                        ? FlutterFlowTheme.of(context)
                                            .primaryText
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    FlutterFlowTheme.of(context).alternate,
                                  ),
                                  width: 3.0,
                                ),
                              ),
                            ),
                            if (Theme.of(context).brightness ==
                                Brightness.light)
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 130.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0x23FFFFFF),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                ),
                              ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'pzdv26cf' /* Jumaa */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Colors.white,
                                                fontSize: 26.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            columnPrayerInformationRecord
                                                .jumaaKhateeb,
                                            'Khateeb',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Colors.white,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: Icon(
                                            Icons.circle_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 10.0,
                                          ),
                                        ),
                                        Text(
                                          dateTimeFormat(
                                            "jm",
                                            columnPrayerInformationRecord
                                                .jumaaTime!,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Colors.white,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 0.0, 20.0, 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            columnPrayerInformationRecord
                                                .jumaaKhateeb2,
                                            'Khateeb 2',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Colors.white,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: Icon(
                                            Icons.circle_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 10.0,
                                          ),
                                        ),
                                        Text(
                                          dateTimeFormat(
                                            "jm",
                                            columnPrayerInformationRecord
                                                .jumaaTime2!,
                                            locale: FFLocalizations.of(context)
                                                .languageCode,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Colors.white,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await launchURL('https://musallas.org/');
                          },
                          child: Container(
                            width: double.infinity,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(40.0),
                              border: Border.all(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 3.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 8.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '4ris13pw' /* Donate */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontSize: 18.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    buttonSize: 40.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.arrow_forward_sharp,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      await launchURL('https://musallas.org/');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 1.0),
              child: SizedBox(
                height: 120.0,
                child: Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 1.0),
                      child: wrapWithModel(
                        model: _model.navigationBarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: const Hero(
                          tag: 'x',
                          transitionOnUserGestures: true,
                          child: Material(
                            color: Colors.transparent,
                            child: NavigationBarWidget(
                              page: 2,
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
    );
  }
}
