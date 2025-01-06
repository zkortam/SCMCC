import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/notification_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'prayer_times_model.dart';
export 'prayer_times_model.dart';

class PrayerTimesWidget extends StatefulWidget {
  const PrayerTimesWidget({super.key});

  @override
  State<PrayerTimesWidget> createState() => _PrayerTimesWidgetState();
}

class _PrayerTimesWidgetState extends State<PrayerTimesWidget> {
  late PrayerTimesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PrayerTimesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.dark);
    });

    _model.firstKhateebFocusNode ??= FocusNode();

    _model.secondKhateebFocusNode ??= FocusNode();

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
        child: Visibility(
          visible: valueOrDefault<bool>(currentUserDocument?.admin, false),
          child: AuthUserStreamWidget(
            builder: (context) => Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
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
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
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

                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('admin');
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(40.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              icon: Icon(
                                                Icons.arrow_back_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                context.pushNamed('admin');
                                              },
                                            ),
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'l0vqbv7o' /* Prayer Times */,
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
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 30.0,
                                              buttonSize: 40.0,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              icon: Icon(
                                                Icons.check_rounded,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                size: 24.0,
                                              ),
                                              onPressed: () async {
                                                await columnPrayerInformationRecord!
                                                    .reference
                                                    .update(
                                                        createPrayerInformationRecordData(
                                                  fajrTime: _model.datePicked1,
                                                  duhrTIme: _model.datePicked2,
                                                  asrTime: _model.datePicked3,
                                                  maghribTime:
                                                      _model.datePicked4,
                                                  ishaTime: _model.datePicked5,
                                                  jumaaTime: _model.datePicked6,
                                                  jumaaKhateeb: _model
                                                      .firstKhateebTextController
                                                      .text,
                                                  lastTimeUpdated:
                                                      getCurrentTimestamp,
                                                  jumaaTime2:
                                                      _model.datePicked7,
                                                  jumaaKhateeb2: _model
                                                      .secondKhateebTextController
                                                      .text,
                                                ));
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  enableDrag: false,
                                                  context: context,
                                                  builder: (context) {
                                                    return Padding(
                                                      padding: MediaQuery
                                                          .viewInsetsOf(
                                                              context),
                                                      child: NotificationWidget(
                                                        text:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                          '1pb3ah0j' /* Saved */,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).then((value) =>
                                                    safeSetState(() {}));
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          // Fajr

                                          final datePicked1Time =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.fromDateTime(
                                                (columnPrayerInformationRecord
                                                        ?.fajrTime ??
                                                    DateTime.now())),
                                            builder: (context, child) {
                                              return wrapInMaterialTimePickerTheme(
                                                context,
                                                child!,
                                                headerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                headerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                headerTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 32.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                pickerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                pickerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                selectedDateTimeBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                selectedDateTimeForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                actionButtonForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                iconSize: 24.0,
                                              );
                                            },
                                          );
                                          if (datePicked1Time != null) {
                                            safeSetState(() {
                                              _model.datePicked1 = DateTime(
                                                (columnPrayerInformationRecord
                                                            ?.fajrTime ??
                                                        DateTime.now())
                                                    .year,
                                                (columnPrayerInformationRecord
                                                            ?.fajrTime ??
                                                        DateTime.now())
                                                    .month,
                                                (columnPrayerInformationRecord
                                                            ?.fajrTime ??
                                                        DateTime.now())
                                                    .day,
                                                datePicked1Time.hour,
                                                datePicked1Time.minute,
                                              );
                                            });
                                          }

                                          await columnPrayerInformationRecord!
                                              .reference
                                              .update(
                                                  createPrayerInformationRecordData(
                                            fajrTime: _model.datePicked1,
                                            lastTimeUpdated:
                                                getCurrentTimestamp,
                                          ));
                                        },
                                        text: 'Fajr: ${dateTimeFormat(
                                          "jm",
                                          columnPrayerInformationRecord
                                              ?.fajrTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        )}',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 50.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0x004B39EF),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 3.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final datePicked2Time =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.fromDateTime(
                                                (columnPrayerInformationRecord
                                                        ?.duhrTIme ??
                                                    DateTime.now())),
                                            builder: (context, child) {
                                              return wrapInMaterialTimePickerTheme(
                                                context,
                                                child!,
                                                headerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                headerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                headerTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 32.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                pickerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                pickerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                selectedDateTimeBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                selectedDateTimeForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                actionButtonForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                iconSize: 24.0,
                                              );
                                            },
                                          );
                                          if (datePicked2Time != null) {
                                            safeSetState(() {
                                              _model.datePicked2 = DateTime(
                                                (columnPrayerInformationRecord
                                                            ?.duhrTIme ??
                                                        DateTime.now())
                                                    .year,
                                                (columnPrayerInformationRecord
                                                            ?.duhrTIme ??
                                                        DateTime.now())
                                                    .month,
                                                (columnPrayerInformationRecord
                                                            ?.duhrTIme ??
                                                        DateTime.now())
                                                    .day,
                                                datePicked2Time.hour,
                                                datePicked2Time.minute,
                                              );
                                            });
                                          }

                                          await columnPrayerInformationRecord!
                                              .reference
                                              .update(
                                                  createPrayerInformationRecordData(
                                            duhrTIme: _model.datePicked2,
                                            lastTimeUpdated:
                                                getCurrentTimestamp,
                                          ));
                                        },
                                        text: 'Duhr: ${dateTimeFormat(
                                          "jm",
                                          columnPrayerInformationRecord
                                              ?.duhrTIme,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        )}',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 50.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0x004B39EF),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 3.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final datePicked3Time =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.fromDateTime(
                                                (columnPrayerInformationRecord
                                                        ?.asrTime ??
                                                    DateTime.now())),
                                            builder: (context, child) {
                                              return wrapInMaterialTimePickerTheme(
                                                context,
                                                child!,
                                                headerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                headerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                headerTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 32.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                pickerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                pickerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                selectedDateTimeBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                selectedDateTimeForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                actionButtonForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                iconSize: 24.0,
                                              );
                                            },
                                          );
                                          if (datePicked3Time != null) {
                                            safeSetState(() {
                                              _model.datePicked3 = DateTime(
                                                (columnPrayerInformationRecord
                                                            ?.asrTime ??
                                                        DateTime.now())
                                                    .year,
                                                (columnPrayerInformationRecord
                                                            ?.asrTime ??
                                                        DateTime.now())
                                                    .month,
                                                (columnPrayerInformationRecord
                                                            ?.asrTime ??
                                                        DateTime.now())
                                                    .day,
                                                datePicked3Time.hour,
                                                datePicked3Time.minute,
                                              );
                                            });
                                          }

                                          await columnPrayerInformationRecord!
                                              .reference
                                              .update(
                                                  createPrayerInformationRecordData(
                                            asrTime: _model.datePicked3,
                                            lastTimeUpdated:
                                                getCurrentTimestamp,
                                          ));
                                        },
                                        text: 'Asr: ${dateTimeFormat(
                                          "jm",
                                          columnPrayerInformationRecord
                                              ?.asrTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        )}',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 50.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0x004B39EF),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 3.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final datePicked4Time =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.fromDateTime(
                                                (columnPrayerInformationRecord
                                                        ?.maghribTime ??
                                                    DateTime.now())),
                                            builder: (context, child) {
                                              return wrapInMaterialTimePickerTheme(
                                                context,
                                                child!,
                                                headerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                headerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                headerTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 32.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                pickerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                pickerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                selectedDateTimeBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                selectedDateTimeForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                actionButtonForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                iconSize: 24.0,
                                              );
                                            },
                                          );
                                          if (datePicked4Time != null) {
                                            safeSetState(() {
                                              _model.datePicked4 = DateTime(
                                                (columnPrayerInformationRecord
                                                            ?.maghribTime ??
                                                        DateTime.now())
                                                    .year,
                                                (columnPrayerInformationRecord
                                                            ?.maghribTime ??
                                                        DateTime.now())
                                                    .month,
                                                (columnPrayerInformationRecord
                                                            ?.maghribTime ??
                                                        DateTime.now())
                                                    .day,
                                                datePicked4Time.hour,
                                                datePicked4Time.minute,
                                              );
                                            });
                                          }

                                          await columnPrayerInformationRecord!
                                              .reference
                                              .update(
                                                  createPrayerInformationRecordData(
                                            maghribTime: _model.datePicked4,
                                            lastTimeUpdated:
                                                getCurrentTimestamp,
                                          ));
                                        },
                                        text: 'Maghrib: ${dateTimeFormat(
                                          "jm",
                                          columnPrayerInformationRecord
                                              ?.maghribTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        )}',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 50.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0x004B39EF),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 3.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final datePicked5Time =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.fromDateTime(
                                                (columnPrayerInformationRecord
                                                        ?.ishaTime ??
                                                    DateTime.now())),
                                            builder: (context, child) {
                                              return wrapInMaterialTimePickerTheme(
                                                context,
                                                child!,
                                                headerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                headerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                headerTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 32.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                pickerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                pickerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                selectedDateTimeBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                selectedDateTimeForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                actionButtonForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                iconSize: 24.0,
                                              );
                                            },
                                          );
                                          if (datePicked5Time != null) {
                                            safeSetState(() {
                                              _model.datePicked5 = DateTime(
                                                (columnPrayerInformationRecord
                                                            ?.ishaTime ??
                                                        DateTime.now())
                                                    .year,
                                                (columnPrayerInformationRecord
                                                            ?.ishaTime ??
                                                        DateTime.now())
                                                    .month,
                                                (columnPrayerInformationRecord
                                                            ?.ishaTime ??
                                                        DateTime.now())
                                                    .day,
                                                datePicked5Time.hour,
                                                datePicked5Time.minute,
                                              );
                                            });
                                          }

                                          await columnPrayerInformationRecord!
                                              .reference
                                              .update(
                                                  createPrayerInformationRecordData(
                                            ishaTime: _model.datePicked5,
                                            lastTimeUpdated:
                                                getCurrentTimestamp,
                                          ));
                                        },
                                        text: 'Isha: ${dateTimeFormat(
                                          "jm",
                                          columnPrayerInformationRecord
                                              ?.ishaTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        )}',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 50.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0x004B39EF),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 3.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      thickness: 2.0,
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 5.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'oygcpgi6' /* First Jumaa */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final datePicked6Time =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.fromDateTime(
                                                (columnPrayerInformationRecord
                                                        ?.jumaaTime ??
                                                    DateTime.now())),
                                            builder: (context, child) {
                                              return wrapInMaterialTimePickerTheme(
                                                context,
                                                child!,
                                                headerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                headerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                headerTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 32.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                pickerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                pickerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                selectedDateTimeBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                selectedDateTimeForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                actionButtonForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                iconSize: 24.0,
                                              );
                                            },
                                          );
                                          if (datePicked6Time != null) {
                                            safeSetState(() {
                                              _model.datePicked6 = DateTime(
                                                (columnPrayerInformationRecord
                                                            ?.jumaaTime ??
                                                        DateTime.now())
                                                    .year,
                                                (columnPrayerInformationRecord
                                                            ?.jumaaTime ??
                                                        DateTime.now())
                                                    .month,
                                                (columnPrayerInformationRecord
                                                            ?.jumaaTime ??
                                                        DateTime.now())
                                                    .day,
                                                datePicked6Time.hour,
                                                datePicked6Time.minute,
                                              );
                                            });
                                          }

                                          await columnPrayerInformationRecord!
                                              .reference
                                              .update(
                                                  createPrayerInformationRecordData(
                                            jumaaTime: _model.datePicked6,
                                            lastTimeUpdated:
                                                getCurrentTimestamp,
                                          ));
                                        },
                                        text: 'Start Time: ${dateTimeFormat(
                                          "jm",
                                          columnPrayerInformationRecord
                                              ?.jumaaTime,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        )}',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 50.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0x004B39EF),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 3.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      controller:
                                          _model.firstKhateebTextController ??=
                                              TextEditingController(
                                        text: columnPrayerInformationRecord
                                            ?.jumaaKhateeb,
                                      ),
                                      focusNode: _model.firstKhateebFocusNode,
                                      onFieldSubmitted: (_) async {
                                        await columnPrayerInformationRecord!
                                            .reference
                                            .update(
                                                createPrayerInformationRecordData(
                                          jumaaKhateeb: _model
                                              .firstKhateebTextController.text,
                                          lastTimeUpdated: getCurrentTimestamp,
                                        ));
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: const NotificationWidget(
                                                text: 'Saved',
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      maxLength: 50,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.enforced,
                                      buildCounter: (context,
                                              {required currentLength,
                                              required isFocused,
                                              maxLength}) =>
                                          null,
                                      validator: _model
                                          .firstKhateebTextControllerValidator
                                          .asValidator(context),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 10.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'vhqcd18d' /* Second Jumaa */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 10.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          final datePicked7Time =
                                              await showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.fromDateTime(
                                                (columnPrayerInformationRecord
                                                        ?.jumaaTime ??
                                                    DateTime.now())),
                                            builder: (context, child) {
                                              return wrapInMaterialTimePickerTheme(
                                                context,
                                                child!,
                                                headerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                headerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                headerTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 32.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                pickerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                pickerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                selectedDateTimeBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                selectedDateTimeForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                actionButtonForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                iconSize: 24.0,
                                              );
                                            },
                                          );
                                          if (datePicked7Time != null) {
                                            safeSetState(() {
                                              _model.datePicked7 = DateTime(
                                                (columnPrayerInformationRecord
                                                            ?.jumaaTime ??
                                                        DateTime.now())
                                                    .year,
                                                (columnPrayerInformationRecord
                                                            ?.jumaaTime ??
                                                        DateTime.now())
                                                    .month,
                                                (columnPrayerInformationRecord
                                                            ?.jumaaTime ??
                                                        DateTime.now())
                                                    .day,
                                                datePicked7Time.hour,
                                                datePicked7Time.minute,
                                              );
                                            });
                                          }

                                          await columnPrayerInformationRecord!
                                              .reference
                                              .update(
                                                  createPrayerInformationRecordData(
                                            lastTimeUpdated:
                                                getCurrentTimestamp,
                                            jumaaTime2: _model.datePicked7,
                                          ));
                                        },
                                        text: 'Start Time: ${dateTimeFormat(
                                          "jm",
                                          columnPrayerInformationRecord
                                              ?.jumaaTime2,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        )}',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 50.0,
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: const Color(0x004B39EF),
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmall
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.white,
                                                    letterSpacing: 0.0,
                                                  ),
                                          elevation: 0.0,
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 3.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                    ),
                                    TextFormField(
                                      controller:
                                          _model.secondKhateebTextController ??=
                                              TextEditingController(
                                        text: columnPrayerInformationRecord
                                            ?.jumaaKhateeb2,
                                      ),
                                      focusNode: _model.secondKhateebFocusNode,
                                      onFieldSubmitted: (_) async {
                                        await columnPrayerInformationRecord!
                                            .reference
                                            .update(
                                                createPrayerInformationRecordData(
                                          lastTimeUpdated: getCurrentTimestamp,
                                          jumaaKhateeb2: _model
                                              .secondKhateebTextController.text,
                                        ));
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: const NotificationWidget(
                                                text: 'Saved',
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));
                                      },
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              letterSpacing: 0.0,
                                            ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      maxLength: 50,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.enforced,
                                      buildCounter: (context,
                                              {required currentLength,
                                              required isFocused,
                                              maxLength}) =>
                                          null,
                                      validator: _model
                                          .secondKhateebTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ],
                                ),
                              ),
                            ].addToEnd(const SizedBox(height: 140.0)),
                          ),
                        );
                      },
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
