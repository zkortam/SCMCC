import '/flutter_flow/flutter_flow_util.dart';
import 'edit_jobs_widget.dart' show EditJobsWidget;
import 'package:flutter/material.dart';

class EditJobsModel extends FlutterFlowModel<EditJobsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // State field(s) for Points widget.
  FocusNode? pointsFocusNode;
  TextEditingController? pointsTextController;
  String? Function(BuildContext, String?)? pointsTextControllerValidator;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();

    pointsFocusNode?.dispose();
    pointsTextController?.dispose();
  }
}
