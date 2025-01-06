import '/components/navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'single_job_widget.dart' show SingleJobWidget;
import 'package:flutter/material.dart';

class SingleJobModel extends FlutterFlowModel<SingleJobWidget> {
  ///  Local state fields for this page.

  int? rebuild = 0;

  ///  State fields for stateful widgets in this page.

  // Model for NavigationBar component.
  late NavigationBarModel navigationBarModel;

  @override
  void initState(BuildContext context) {
    navigationBarModel = createModel(context, () => NavigationBarModel());
  }

  @override
  void dispose() {
    navigationBarModel.dispose();
  }
}
