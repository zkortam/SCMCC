import '/backend/backend.dart';
import '/components/announcement_widget.dart';
import '/components/navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'announcements_model.dart';
export 'announcements_model.dart';

class AnnouncementsWidget extends StatefulWidget {
  const AnnouncementsWidget({super.key});

  @override
  State<AnnouncementsWidget> createState() => _AnnouncementsWidgetState();
}

class _AnnouncementsWidgetState extends State<AnnouncementsWidget> {
  late AnnouncementsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AnnouncementsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            10.0, 0.0, 10.0, 10.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed('Profile');
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
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30.0,
                                      buttonSize: 40.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).primary,
                                      icon: Icon(
                                        Icons.arrow_back_sharp,
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        size: 24.0,
                                      ),
                                      onPressed: () async {
                                        context.pushNamed('Profile');
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 20.0, 0.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'fw0sj86t' /* Announcements */,
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: StreamBuilder<List<AnnouncementsRecord>>(
                          stream: queryAnnouncementsRecord(
                            queryBuilder: (announcementsRecord) =>
                                announcementsRecord.orderBy('time',
                                    descending: true),
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
                            List<AnnouncementsRecord>
                                columnAnnouncementsRecordList = snapshot.data!;

                            return SingleChildScrollView(
                              primary: false,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                        columnAnnouncementsRecordList.length,
                                        (columnIndex) {
                                  final columnAnnouncementsRecord =
                                      columnAnnouncementsRecordList[
                                          columnIndex];
                                  return AnnouncementWidget(
                                    key: Key(
                                        'Keym8n_${columnIndex}_of_${columnAnnouncementsRecordList.length}'),
                                    announcement: columnAnnouncementsRecord,
                                  );
                                })
                                    .divide(const SizedBox(height: 10.0))
                                    .addToEnd(const SizedBox(height: 130.0)),
                              ),
                            );
                          },
                        ),
                      ),
                    ]
                        .divide(const SizedBox(height: 1.0))
                        .addToEnd(const SizedBox(height: 130.0)),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 1.0),
                child: SizedBox(
                  height: 120.0,
                  child: Stack(
                    children: [
                      wrapWithModel(
                        model: _model.navigationBarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: const NavigationBarWidget(
                          page: 4,
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
