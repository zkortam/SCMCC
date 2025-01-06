import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'single_job_model.dart';
export 'single_job_model.dart';

class SingleJobWidget extends StatefulWidget {
  const SingleJobWidget({
    super.key,
    required this.job,
  });

  final JobsRecord? job;

  @override
  State<SingleJobWidget> createState() => _SingleJobWidgetState();
}

class _SingleJobWidgetState extends State<SingleJobWidget> {
  late SingleJobModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SingleJobModel());

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
                padding: const EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('Jobs');
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      color: FlutterFlowTheme.of(context).info,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      context.pushNamed('Jobs');
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 20.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '5jw1tb21' /* Jobs */,
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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        width: double.infinity,
                        height: 175.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 3.0,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              valueOrDefault<String>(
                                widget.job?.title,
                                'Title',
                              ),
                              maxLines: 2,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 0.0),
                              child: Container(
                                height: 35.0,
                                constraints: const BoxConstraints(
                                  minWidth: 130.0,
                                  maxWidth: 200.0,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xC2C52020),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: Text(
                                        'Apply By: ${dateTimeFormat(
                                          "M/d h:mm a",
                                          widget.job?.time,
                                          locale: FFLocalizations.of(context)
                                              .languageCode,
                                        )}',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (!functions.isUserRegistered(
                                currentUserReference!,
                                widget.job!.applicants.toList()))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await widget.job!.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'Applicants': FieldValue.arrayUnion(
                                              [currentUserReference]),
                                        },
                                      ),
                                    });
                                    _model.rebuild = 2;
                                    safeSetState(() {});
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '31j82r4z' /* Apply */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 200.0,
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ),
                              ),
                            if (functions.isUserRegistered(
                                currentUserReference!,
                                widget.job!.applicants.toList()))
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    print('Button pressed ...');
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'zgre2d3g' /* You have Applied */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 200.0,
                                    height: 40.0,
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    if (valueOrDefault(currentUserDocument?.resume, '') == '')
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Container(
                            width: double.infinity,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: const Color(0xA4DDC10C),
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
                                      'gfma4nix' /* Warning: You have no Resume on... */,
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
                      ),
                    Flexible(
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Flexible(
                              child: Text(
                                valueOrDefault<String>(
                                  widget.job?.description,
                                  'Desc',
                                ),
                                textAlign: TextAlign.start,
                                maxLines: 10,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
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
                          page: 3,
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
