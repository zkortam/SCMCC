import '/flutter_flow/flutter_flow_util.dart';
import 'create_resource_widget.dart' show CreateResourceWidget;
import 'package:flutter/material.dart';

class CreateResourceModel extends FlutterFlowModel<CreateResourceWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for Title widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleFocusNode?.dispose();
    titleTextController?.dispose();
  }
}
