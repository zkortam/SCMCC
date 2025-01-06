import '/flutter_flow/flutter_flow_util.dart';
import 'email_login_widget.dart' show EmailLoginWidget;
import 'package:flutter/material.dart';

class EmailLoginModel extends FlutterFlowModel<EmailLoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    emailFocusNode?.dispose();
    emailTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
