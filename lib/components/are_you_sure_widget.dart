import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'are_you_sure_model.dart';
export 'are_you_sure_model.dart';

class AreYouSureWidget extends StatefulWidget {
  const AreYouSureWidget({super.key});

  @override
  State<AreYouSureWidget> createState() => _AreYouSureWidgetState();
}

class _AreYouSureWidgetState extends State<AreYouSureWidget> {
  late AreYouSureModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AreYouSureModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
      child: Container(
        width: double.infinity,
        height: 160.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 0.0),
              child: Container(
                width: double.infinity,
                height: 40.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      FFLocalizations.of(context).getText(
                        'njzk7sn0' /* Account Deletion */,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Montserrat',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
              child: Container(
                decoration: const BoxDecoration(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'jjs8x0u1' /* Are you sure that you would li... */,
                    ),
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Montserrat',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 10.0, 5.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        await authManager.deleteUser(context);

                        context.goNamedAuth('Home', context.mounted);
                      },
                      text: FFLocalizations.of(context).getText(
                        'o9zk2dhb' /* Confirm */,
                      ),
                      options: FFButtonOptions(
                        width: 200.0,
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 10.0, 5.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: FFLocalizations.of(context).getText(
                        'sfkjgcdw' /* Go Back */,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).alternate,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 3.0,
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
