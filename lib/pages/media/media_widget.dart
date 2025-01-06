import '/backend/backend.dart';
import '/components/media_display_card_widget.dart';
import '/components/navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'media_model.dart';
export 'media_model.dart';

class MediaWidget extends StatefulWidget {
  const MediaWidget({super.key});

  @override
  State<MediaWidget> createState() => _MediaWidgetState();
}

class _MediaWidgetState extends State<MediaWidget>
    with TickerProviderStateMixin {
  late MediaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MediaModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!FFAppState().hasOpenedMedia) {
        _model.soundPlayer ??= AudioPlayer();
        if (_model.soundPlayer!.playing) {
          await _model.soundPlayer!.stop();
        }
        _model.soundPlayer!.setVolume(1.0);
        _model.soundPlayer!
            .setAsset(
                'assets/audios/Cinematic_Flashback_Sound_Effect_[_ezmp3.cc_].mp3')
            .then((_) => _model.soundPlayer!.play());

        FFAppState().hasOpenedMedia = true;
        safeSetState(() {});
      }
    });

    animationsMap.addAll({
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 2000.0.ms,
            duration: 1000.0.ms,
            begin: const Offset(1.0, 1.0),
            end: const Offset(5.0, 5.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 2000.0.ms,
            duration: 1000.0.ms,
            begin: 1.0,
            end: 0.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 3000.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 3000.0.ms,
            duration: 1000.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
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
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.movie_creation_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 70.0,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'pfltldoq' /* SCMCC */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Montserrat',
                                  fontSize: 30.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ).animateOnPageLoad(
                    animationsMap['columnOnPageLoadAnimation1']!),
              ),
              if (true)
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 10.0, 0.0),
                              child: Icon(
                                Icons.movie_creation_rounded,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 30.0,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'yydblgbm' /* SCMCC Media */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 10.0, 20.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('resources');
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50.0,
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
                                  20.0, 0.0, 6.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '7suvc5ou' /* Written resources */,
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
                                    buttonSize: 35.0,
                                    fillColor:
                                        FlutterFlowTheme.of(context).primary,
                                    icon: Icon(
                                      Icons.arrow_forward_sharp,
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 20.0,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed('resources');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 0.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '313opga3' /* Top 10 */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                        child: FutureBuilder<List<MediaRecord>>(
                          future: queryMediaRecordOnce(
                            queryBuilder: (mediaRecord) => mediaRecord
                                .orderBy('clicksInt', descending: true),
                            limit: 10,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitRipple(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<MediaRecord> rowMediaRecordList =
                                snapshot.data!;

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                        rowMediaRecordList.length, (rowIndex) {
                                  final rowMediaRecord =
                                      rowMediaRecordList[rowIndex];
                                  return SizedBox(
                                    width: 275.0,
                                    height: 175.0,
                                    child: Stack(
                                      children: [
                                        Opacity(
                                          opacity: 0.6,
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'singleMedia',
                                                queryParameters: {
                                                  'media': serializeParam(
                                                    rowMediaRecord,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'media': rowMediaRecord,
                                                },
                                              );

                                              await rowMediaRecord.reference
                                                  .update({
                                                ...mapToFirestore(
                                                  {
                                                    'clicksInt':
                                                        FieldValue.increment(1),
                                                  },
                                                ),
                                              });
                                            },
                                            child: Container(
                                              width: 275.0,
                                              height: 175.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    rowMediaRecord.banner,
                                                  ).image,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 2.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 10.0, 0.0),
                                                child: Text(
                                                  rowMediaRecord.title,
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 1.0),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Opacity(
                                                  opacity: 0.8,
                                                  child: Container(
                                                    width: 30.0,
                                                    height: 30.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(0xFFDA2933),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              40.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          functions
                                                              .adder(rowIndex)
                                                              .toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                letterSpacing:
                                                                    0.0,
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
                                      ],
                                    ),
                                  );
                                })
                                    .divide(const SizedBox(width: 10.0))
                                    .addToStart(const SizedBox(width: 10.0)),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                '0kzbykzp' /* Latest Releases */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: StreamBuilder<List<MediaRecord>>(
                          stream: queryMediaRecord(
                            queryBuilder: (mediaRecord) =>
                                mediaRecord.orderBy('time', descending: true),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitRipple(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<MediaRecord> rowMediaRecordList =
                                snapshot.data!;

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                        rowMediaRecordList.length, (rowIndex) {
                                  final rowMediaRecord =
                                      rowMediaRecordList[rowIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await rowMediaRecord.reference.update({
                                        ...mapToFirestore(
                                          {
                                            'clicksInt':
                                                FieldValue.increment(1),
                                          },
                                        ),
                                      });
                                    },
                                    child: MediaDisplayCardWidget(
                                      key: Key(
                                          'Keyyk8_${rowIndex}_of_${rowMediaRecordList.length}'),
                                      media: rowMediaRecord,
                                    ),
                                  );
                                })
                                    .divide(const SizedBox(width: 10.0))
                                    .addToStart(const SizedBox(width: 10.0)),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'xa6ln3qd' /* For Brothers */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: StreamBuilder<List<MediaRecord>>(
                          stream: queryMediaRecord(
                            queryBuilder: (mediaRecord) => mediaRecord
                                .where(
                                  'category',
                                  isEqualTo: 'Brothers',
                                )
                                .orderBy('time', descending: true),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitRipple(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<MediaRecord> rowMediaRecordList =
                                snapshot.data!;

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                        rowMediaRecordList.length, (rowIndex) {
                                  final rowMediaRecord =
                                      rowMediaRecordList[rowIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await rowMediaRecord.reference.update({
                                        ...mapToFirestore(
                                          {
                                            'clicksInt':
                                                FieldValue.increment(1),
                                          },
                                        ),
                                      });
                                    },
                                    child: MediaDisplayCardWidget(
                                      key: Key(
                                          'Keywza_${rowIndex}_of_${rowMediaRecordList.length}'),
                                      media: rowMediaRecord,
                                    ),
                                  );
                                })
                                    .divide(const SizedBox(width: 10.0))
                                    .addToStart(const SizedBox(width: 10.0)),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 10.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'lspvvz6j' /* For Sisters */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: StreamBuilder<List<MediaRecord>>(
                          stream: queryMediaRecord(
                            queryBuilder: (mediaRecord) => mediaRecord
                                .where(
                                  'category',
                                  isEqualTo: 'Sisters',
                                )
                                .orderBy('time', descending: true),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: SpinKitRipple(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 50.0,
                                  ),
                                ),
                              );
                            }
                            List<MediaRecord> rowMediaRecordList =
                                snapshot.data!;

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                        rowMediaRecordList.length, (rowIndex) {
                                  final rowMediaRecord =
                                      rowMediaRecordList[rowIndex];
                                  return InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await rowMediaRecord.reference.update({
                                        ...mapToFirestore(
                                          {
                                            'clicksInt':
                                                FieldValue.increment(1),
                                          },
                                        ),
                                      });
                                    },
                                    child: MediaDisplayCardWidget(
                                      key: Key(
                                          'Keyb77_${rowIndex}_of_${rowMediaRecordList.length}'),
                                      media: rowMediaRecord,
                                    ),
                                  );
                                })
                                    .divide(const SizedBox(width: 10.0))
                                    .addToStart(const SizedBox(width: 10.0)),
                              ),
                            );
                          },
                        ),
                      ),
                    ].addToEnd(const SizedBox(height: 120.0)),
                  ),
                ).animateOnPageLoad(
                    animationsMap['columnOnPageLoadAnimation2']!),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: SizedBox(
                  height: 120.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: wrapWithModel(
                          model: _model.navigationBarModel,
                          updateCallback: () => safeSetState(() {}),
                          child: const NavigationBarWidget(
                            page: 1,
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
