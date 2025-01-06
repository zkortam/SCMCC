import '/components/navigation_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'media_widget.dart' show MediaWidget;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MediaModel extends FlutterFlowModel<MediaWidget> {
  ///  State fields for stateful widgets in this page.

  AudioPlayer? soundPlayer;
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
