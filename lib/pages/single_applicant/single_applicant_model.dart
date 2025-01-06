import '/flutter_flow/flutter_flow_util.dart';
import 'single_applicant_widget.dart' show SingleApplicantWidget;
import 'package:flutter/material.dart';

class SingleApplicantModel extends FlutterFlowModel<SingleApplicantWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();
  }
}
