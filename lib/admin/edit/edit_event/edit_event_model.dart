import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'edit_event_widget.dart' show EditEventWidget;
import 'package:flutter/material.dart';

class EditEventModel extends FlutterFlowModel<EditEventWidget> {
  ///  Local state fields for this page.

  int reset = 0;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Title widget.
  FocusNode? titleFocusNode1;
  TextEditingController? titleTextController1;
  String? Function(BuildContext, String?)? titleTextController1Validator;
  // State field(s) for LocationField widget.
  FocusNode? locationFieldFocusNode;
  TextEditingController? locationFieldTextController;
  String? Function(BuildContext, String?)? locationFieldTextControllerValidator;
  // State field(s) for Points widget.
  FocusNode? pointsFocusNode1;
  TextEditingController? pointsTextController1;
  String? Function(BuildContext, String?)? pointsTextController1Validator;
  // State field(s) for Points widget.
  FocusNode? pointsFocusNode2;
  TextEditingController? pointsTextController2;
  String? Function(BuildContext, String?)? pointsTextController2Validator;
  DateTime? datePicked1;
  DateTime? datePicked2;
  // State field(s) for Title widget.
  FocusNode? titleFocusNode2;
  TextEditingController? titleTextController2;
  String? Function(BuildContext, String?)? titleTextController2Validator;
  DateTime? datePicked3;
  // State field(s) for StartTime widget.
  FocusNode? startTimeFocusNode;
  TextEditingController? startTimeTextController;
  String? Function(BuildContext, String?)? startTimeTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    tabBarController?.dispose();
    titleFocusNode1?.dispose();
    titleTextController1?.dispose();

    locationFieldFocusNode?.dispose();
    locationFieldTextController?.dispose();

    pointsFocusNode1?.dispose();
    pointsTextController1?.dispose();

    pointsFocusNode2?.dispose();
    pointsTextController2?.dispose();

    titleFocusNode2?.dispose();
    titleTextController2?.dispose();

    startTimeFocusNode?.dispose();
    startTimeTextController?.dispose();
  }
}
