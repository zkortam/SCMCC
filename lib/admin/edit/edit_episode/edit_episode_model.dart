import '/flutter_flow/flutter_flow_util.dart';
import 'edit_episode_widget.dart' show EditEpisodeWidget;
import 'package:flutter/material.dart';

class EditEpisodeModel extends FlutterFlowModel<EditEpisodeWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Title widget.
  FocusNode? titleFocusNode1;
  TextEditingController? titleTextController1;
  String? Function(BuildContext, String?)? titleTextController1Validator;
  // State field(s) for Title widget.
  FocusNode? titleFocusNode2;
  TextEditingController? titleTextController2;
  String? Function(BuildContext, String?)? titleTextController2Validator;
  // State field(s) for Title widget.
  FocusNode? titleFocusNode3;
  TextEditingController? titleTextController3;
  String? Function(BuildContext, String?)? titleTextController3Validator;
  // State field(s) for Points widget.
  FocusNode? pointsFocusNode;
  TextEditingController? pointsTextController;
  String? Function(BuildContext, String?)? pointsTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleFocusNode1?.dispose();
    titleTextController1?.dispose();

    titleFocusNode2?.dispose();
    titleTextController2?.dispose();

    titleFocusNode3?.dispose();
    titleTextController3?.dispose();

    pointsFocusNode?.dispose();
    pointsTextController?.dispose();
  }
}
