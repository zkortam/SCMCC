import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'event_model.dart';
export 'event_model.dart';

class EventWidget extends StatefulWidget {
  const EventWidget({
    super.key,
    required this.event,
  });

  final EventsRecord? event;

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  late EventModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210.0,
      child: Stack(
        children: [
          Opacity(
            opacity: 0.45,
            child: Container(
              width: double.infinity,
              height: 210.0,
              constraints: const BoxConstraints(
                maxWidth: 570.0,
                maxHeight: 210.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.network(
                    widget.event!.banner,
                  ).image,
                ),
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
                border: Border.all(
                  color: functions.isUserRegistered(currentUserReference!,
                          widget.event!.registrants.toList())
                      ? FlutterFlowTheme.of(context).primary
                      : FlutterFlowTheme.of(context).alternate,
                  width: 4.0,
                ),
              ),
            ),
          ),
          Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      if (!functions.isUserRegistered(currentUserReference!,
                              widget.event!.registrants.toList()) &&
                          (getCurrentTimestamp < widget.event!.rSVPbyTime!))
                        Container(
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: const Color(0xFFDD2832),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Text(
                                  'RSVP by ${dateTimeFormat(
                                    "M/d H:mm",
                                    widget.event?.rSVPbyTime,
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  )}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (functions.isUserRegistered(currentUserReference!,
                              widget.event!.registrants.toList()) &&
                          (getCurrentTimestamp < widget.event!.rSVPbyTime!))
                        Container(
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).success,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'gw9ixv4u' /* You Are Registered */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      if (widget.event!.rSVPbyTime! < getCurrentTimestamp)
                        Container(
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'gaw8e2nr' /* Event Concluded */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                    child: Text(
                      valueOrDefault<String>(
                        widget.event?.name,
                        'Name',
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'Montserrat',
                            fontSize: 28.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                          child: Text(
                            '${dateTimeFormat(
                              "Md",
                              widget.event?.startTime,
                              locale: FFLocalizations.of(context).languageCode,
                            )}, ${dateTimeFormat(
                              "jm",
                              widget.event?.startTime,
                              locale: FFLocalizations.of(context).languageCode,
                            )}-${dateTimeFormat(
                              "jm",
                              widget.event?.endTime,
                              locale: FFLocalizations.of(context).languageCode,
                            )}',
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
                              5.0, 0.0, 5.0, 0.0),
                          child: Icon(
                            Icons.circle_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 10.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 10.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget.event?.location,
                              'Location',
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
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            context.pushNamed(
                              'EventPage',
                              queryParameters: {
                                'id': serializeParam(
                                  widget.event?.reference,
                                  ParamType.DocumentReference,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: FFLocalizations.of(context).getText(
                            '1v8moxw4' /* Learn More */,
                          ),
                          options: FFButtonOptions(
                            height: 44.0,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(1200.0),
                          ),
                        ),
                      ),
                      if (valueOrDefault<bool>(
                              currentUserDocument?.isComplete, false) &&
                          (widget.event!.rSVPbyTime! > getCurrentTimestamp))
                        AuthUserStreamWidget(
                          builder: (context) => Stack(
                            children: [
                              if (!functions.isUserRegistered(
                                  currentUserReference!,
                                  widget.event!.registrants.toList()))
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 1.0, 0.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await widget.event!.reference.update({
                                        ...mapToFirestore(
                                          {
                                            'Registrants':
                                                FieldValue.arrayUnion(
                                                    [currentUserReference]),
                                          },
                                        ),
                                      });
                                      HapticFeedback.selectionClick();
                                      if (widget.event?.link != null &&
                                          widget.event?.link != '') {
                                        await launchURL(widget.event!.link);
                                      }
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'z6pv6ume' /* Register */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 150.0,
                                      height: 44.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(1200.0),
                                    ),
                                  ),
                                ),
                              if (functions.isUserRegistered(
                                  currentUserReference!,
                                  widget.event!.registrants.toList()))
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await widget.event!.reference.update({
                                          ...mapToFirestore(
                                            {
                                              'Registrants':
                                                  FieldValue.arrayRemove(
                                                      [currentUserReference]),
                                            },
                                          ),
                                        });
                                      },
                                      child: Container(
                                        width: 150.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFDD2832),
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'unqgx9fm' /* Unregister */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.white,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
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
                    ],
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
