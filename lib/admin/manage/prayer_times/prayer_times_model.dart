import '/flutter_flow/flutter_flow_util.dart';
import 'prayer_times_widget.dart' show PrayerTimesWidget;
import 'package:flutter/material.dart';

class PrayerTimesModel extends FlutterFlowModel<PrayerTimesWidget> {
  ///  State fields for stateful widgets in this page.

  DateTime? datePicked1;
  DateTime? datePicked2;
  DateTime? datePicked3;
  DateTime? datePicked4;
  DateTime? datePicked5;
  DateTime? datePicked6;
  // State field(s) for FirstKhateeb widget.
  FocusNode? firstKhateebFocusNode;
  TextEditingController? firstKhateebTextController;
  String? Function(BuildContext, String?)? firstKhateebTextControllerValidator;
  DateTime? datePicked7;
  // State field(s) for SecondKhateeb widget.
  FocusNode? secondKhateebFocusNode;
  TextEditingController? secondKhateebTextController;
  String? Function(BuildContext, String?)? secondKhateebTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    firstKhateebFocusNode?.dispose();
    firstKhateebTextController?.dispose();

    secondKhateebFocusNode?.dispose();
    secondKhateebTextController?.dispose();
  }
}
