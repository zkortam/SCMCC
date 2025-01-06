import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_announcement_widget.dart' show CreateAnnouncementWidget;
import 'package:flutter/material.dart';

class CreateAnnouncementModel
    extends FlutterFlowModel<CreateAnnouncementWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for StartTime widget.
  FocusNode? startTimeFocusNode;
  TextEditingController? startTimeTextController;
  String? Function(BuildContext, String?)? startTimeTextControllerValidator;
  // State field(s) for Title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Publish widget.
  List<UsersRecord>? users;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    startTimeFocusNode?.dispose();
    startTimeTextController?.dispose();

    titleFocusNode?.dispose();
    titleTextController?.dispose();
  }
}
