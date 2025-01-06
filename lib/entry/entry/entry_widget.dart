import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'entry_model.dart';
export 'entry_model.dart';

class EntryWidget extends StatefulWidget {
  const EntryWidget({super.key});

  @override
  State<EntryWidget> createState() => _EntryWidgetState();
}

class _EntryWidgetState extends State<EntryWidget>
    with TickerProviderStateMixin {
  late EntryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EntryModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setDarkModeSetting(context, ThemeMode.system);
    });

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.0, 140.0),
            end: const Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(0.9, 0.9),
            end: const Offset(1.0, 1.0),
          ),
          TiltEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 300.0.ms,
            begin: const Offset(-0.349, 0),
            end: const Offset(0, 0),
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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0F981E), Color(0xFF148977)],
                  stops: [0.0, 1.0],
                  begin: AlignmentDirectional(0.0, -1.0),
                  end: AlignmentDirectional(0, 1.0),
                ),
              ),
              alignment: const AlignmentDirectional(0.0, -1.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 10.0),
                    child: Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(
                        maxWidth: 570.0,
                      ),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              0.0,
                              2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'kyvwzrp5' /* SCMCC */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 32.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 10.0, 0.0, 20.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    '2ggd6ayb' /* Please fill the information be... */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 20.0),
                                child: FaIcon(
                                  FontAwesomeIcons.mosque,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 50.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    GoRouter.of(context).prepareAuthEvent(true);
                                    final user = await authManager
                                        .signInWithGoogle(context);
                                    if (user == null) {
                                      return;
                                    }
                                    if (valueOrDefault<bool>(
                                            currentUserDocument?.isComplete,
                                            false) ==
                                        true) {
                                      context.goNamedAuth(
                                        'Home',
                                        context.mounted,
                                        ignoreRedirect: true,
                                      );
                                    } else {
                                      context.goNamedAuth(
                                        'CreateAccount',
                                        context.mounted,
                                        ignoreRedirect: true,
                                      );
                                    }
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(40.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 3.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 30.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            buttonSize: 40.0,
                                            icon: FaIcon(
                                              FontAwesomeIcons.google,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 20.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'ks9l4l73' /* Sign in with Google */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    GoRouter.of(context).prepareAuthEvent(true);
                                    final user = await authManager
                                        .signInWithApple(context);
                                    if (user == null) {
                                      return;
                                    }
                                    if (valueOrDefault<bool>(
                                            currentUserDocument?.isComplete,
                                            false) ==
                                        true) {
                                      context.goNamedAuth(
                                        'Home',
                                        context.mounted,
                                        ignoreRedirect: true,
                                      );
                                    } else {
                                      context.goNamedAuth(
                                        'CreateAccount',
                                        context.mounted,
                                        ignoreRedirect: true,
                                      );
                                    }
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(40.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 3.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 30.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            buttonSize: 40.0,
                                            icon: FaIcon(
                                              FontAwesomeIcons.apple,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 23.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'yfablgwc' /* Sign in with Apple */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context.pushNamed('emailLogin');
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 55.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(40.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 3.0,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 30.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 30.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.email_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 25.0,
                                            ),
                                            onPressed: () {
                                              print('IconButton pressed ...');
                                            },
                                          ),
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'dg5gyhb3' /* Sign in with Email */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        GoRouter.of(context).prepareAuthEvent();
                        final user =
                            await authManager.signInAnonymously(context);
                        if (user == null) {
                          return;
                        }

                        await currentUserReference!
                            .update(createUsersRecordData(
                          isComplete: false,
                        ));

                        context.pushNamedAuth('Home', context.mounted);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 55.0,
                        constraints: const BoxConstraints(
                          maxWidth: 570.0,
                        ),
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          borderRadius: BorderRadius.circular(40.0),
                          border: Border.all(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            width: 3.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 30.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30.0,
                                buttonSize: 40.0,
                                icon: Icon(
                                  Icons.person,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 25.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  '121q7qax' /* Enter as a Guest */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await launchURL('https://zakariakortam.com/scmcc');
                      },
                      child: RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'shpsw24j' /* By creating an account, you ag... */,
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'ohkabwc0' /* Terms and Conditions */,
                              ),
                              style: const TextStyle(
                                color: Color(0xFF5EC2CF),
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'ge30j7wu' /*  and  */,
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: FFLocalizations.of(context).getText(
                                'dspuvh8s' /* EULA */,
                              ),
                              style: const TextStyle(
                                color: Color(0xFF5EC2CF),
                              ),
                            )
                          ],
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                        textAlign: TextAlign.center,
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
  }
}
