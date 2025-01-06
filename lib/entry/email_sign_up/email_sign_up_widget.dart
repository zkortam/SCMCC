import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'email_sign_up_model.dart';
export 'email_sign_up_model.dart';

class EmailSignUpWidget extends StatefulWidget {
  const EmailSignUpWidget({super.key});

  @override
  State<EmailSignUpWidget> createState() => _EmailSignUpWidgetState();
}

class _EmailSignUpWidgetState extends State<EmailSignUpWidget>
    with TickerProviderStateMixin {
  late EmailSignUpModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmailSignUpModel());

    _model.emailTextController ??= TextEditingController();
    _model.emailFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    _model.confirmpasswordTextController ??= TextEditingController();
    _model.confirmpasswordFocusNode ??= FocusNode();

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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
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
                          const EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('Entry');
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
                                      context.pushNamed('Entry');
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 20.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '0oh898e9' /* Signing up with Email */,
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
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: double.infinity,
                        constraints: const BoxConstraints(
                          maxWidth: 570.0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                      'ipnr9gmc' /* Sign Up */,
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
                                      0.0, 10.0, 0.0, 24.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'oayztqh1' /* Please fill the information be... */,
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
                                      0.0, 0.0, 0.0, 10.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: _model.emailTextController,
                                      focusNode: _model.emailFocusNode,
                                      autofocus: false,
                                      autofillHints: const [AutofillHints.email],
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Montserrat',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'cjv2b0u9' /* Email */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        contentPadding: const EdgeInsets.all(20.0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: _model
                                          .emailTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller: _model.passwordTextController,
                                      focusNode: _model.passwordFocusNode,
                                      autofocus: false,
                                      autofillHints: const [AutofillHints.email],
                                      obscureText: !_model.passwordVisibility,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Montserrat',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'qb25b0t3' /* Password */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        contentPadding: const EdgeInsets.all(20.0),
                                        suffixIcon: InkWell(
                                          onTap: () => safeSetState(
                                            () => _model.passwordVisibility =
                                                !_model.passwordVisibility,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            _model.passwordVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      maxLength: 16,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.enforced,
                                      buildCounter: (context,
                                              {required currentLength,
                                              required isFocused,
                                              maxLength}) =>
                                          null,
                                      validator: _model
                                          .passwordTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: TextFormField(
                                      controller:
                                          _model.confirmpasswordTextController,
                                      focusNode:
                                          _model.confirmpasswordFocusNode,
                                      autofocus: false,
                                      autofillHints: const [AutofillHints.email],
                                      obscureText:
                                          !_model.confirmpasswordVisibility,
                                      decoration: InputDecoration(
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Montserrat',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText:
                                            FFLocalizations.of(context).getText(
                                          'vebqonso' /* Confirm Password */,
                                        ),
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyLarge
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        contentPadding: const EdgeInsets.all(20.0),
                                        suffixIcon: InkWell(
                                          onTap: () => safeSetState(
                                            () => _model
                                                    .confirmpasswordVisibility =
                                                !_model
                                                    .confirmpasswordVisibility,
                                          ),
                                          focusNode:
                                              FocusNode(skipTraversal: true),
                                          child: Icon(
                                            _model.confirmpasswordVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                      maxLength: 16,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.enforced,
                                      buildCounter: (context,
                                              {required currentLength,
                                              required isFocused,
                                              maxLength}) =>
                                          null,
                                      validator: _model
                                          .confirmpasswordTextControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 1.0, 0.0, 10.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      GoRouter.of(context)
                                          .prepareAuthEvent(true);
                                      if (_model.passwordTextController.text !=
                                          _model.confirmpasswordTextController
                                              .text) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'Passwords don\'t match!',
                                            ),
                                          ),
                                        );
                                        return;
                                      }

                                      final user = await authManager
                                          .createAccountWithEmail(
                                        context,
                                        _model.emailTextController.text,
                                        _model.passwordTextController.text,
                                      );
                                      if (user == null) {
                                        return;
                                      }

                                      await UsersRecord.collection
                                          .doc(user.uid)
                                          .update(createUsersRecordData(
                                            email:
                                                _model.emailTextController.text,
                                          ));

                                      context.goNamedAuth(
                                        'CreateAccount',
                                        context.mounted,
                                        ignoreRedirect: true,
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '20ctkdus' /* Create Account */,
                                    ),
                                    options: FFButtonOptions(
                                      width: double.infinity,
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

                                // You will have to add an action on this rich text to go to your login page.
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 10.0, 0.0, 10.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      context.pushNamed('emailLogin');
                                    },
                                    child: RichText(
                                      textScaler:
                                          MediaQuery.of(context).textScaler,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              '0p5fyovx' /* Already have an account?  */,
                                            ),
                                            style: const TextStyle(),
                                          ),
                                          TextSpan(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              's8pbx293' /* Log in */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Montserrat',
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
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
