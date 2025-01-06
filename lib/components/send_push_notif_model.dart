import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'send_push_notif_widget.dart' show SendPushNotifWidget;
import 'package:flutter/material.dart';

class SendPushNotifModel extends FlutterFlowModel<SendPushNotifWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Send widget.
  List<UsersRecord>? query;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
