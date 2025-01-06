import '/flutter_flow/flutter_flow_util.dart';
import 'event_attendance_widget.dart' show EventAttendanceWidget;
import 'package:flutter/material.dart';

class EventAttendanceModel extends FlutterFlowModel<EventAttendanceWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Code widget.
  FocusNode? codeFocusNode;
  TextEditingController? codeTextController;
  String? Function(BuildContext, String?)? codeTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    codeFocusNode?.dispose();
    codeTextController?.dispose();
  }
}
