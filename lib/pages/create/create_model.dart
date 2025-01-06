import '/flutter_flow/flutter_flow_util.dart';
import 'create_widget.dart' show CreateWidget;
import 'package:flutter/material.dart';

class CreateModel extends FlutterFlowModel<CreateWidget> {
  ///  Local state fields for this page.

  bool isSpoiler = false;

  bool isPoll = false;

  bool isBeautifiedState = false;

  List<String> media = [];
  void addToMedia(String item) => media.add(item);
  void removeFromMedia(String item) => media.remove(item);
  void removeAtIndexFromMedia(int index) => media.removeAt(index);
  void insertAtIndexInMedia(int index, String item) =>
      media.insert(index, item);
  void updateMediaAtIndex(int index, Function(String) updateFn) =>
      media[index] = updateFn(media[index]);

  List<String> voteOptions = [];
  void addToVoteOptions(String item) => voteOptions.add(item);
  void removeFromVoteOptions(String item) => voteOptions.remove(item);
  void removeAtIndexFromVoteOptions(int index) => voteOptions.removeAt(index);
  void insertAtIndexInVoteOptions(int index, String item) =>
      voteOptions.insert(index, item);
  void updateVoteOptionsAtIndex(int index, Function(String) updateFn) =>
      voteOptions[index] = updateFn(voteOptions[index]);

  int addMoreValue = 0;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // Stores action output result for [Gemini - Generate Text] action in IconButton widget.
  String? beautifiedText;
  // Stores action output result for [Bottom Sheet - BeautifyText] action in IconButton widget.
  bool? isBeautified;
  // Stores action output result for [Gemini - Generate Text] action in CaptionSet widget.
  String? textSummary;
  // State field(s) for TitleThreads widget.
  FocusNode? titleThreadsFocusNode;
  TextEditingController? titleThreadsTextController;
  String? Function(BuildContext, String?)? titleThreadsTextControllerValidator;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for TextThread widget.
  FocusNode? textThreadFocusNode;
  TextEditingController? textThreadTextController;
  String? Function(BuildContext, String?)? textThreadTextControllerValidator;
  // State field(s) for Title widget.
  FocusNode? titleFocusNode1;
  TextEditingController? titleTextController1;
  String? Function(BuildContext, String?)? titleTextController1Validator;
  // State field(s) for Title widget.
  FocusNode? titleFocusNode2;
  TextEditingController? titleTextController2;
  String? Function(BuildContext, String?)? titleTextController2Validator;
  // State field(s) for option3 widget.
  FocusNode? option3FocusNode;
  TextEditingController? option3TextController;
  String? Function(BuildContext, String?)? option3TextControllerValidator;
  // State field(s) for option4 widget.
  FocusNode? option4FocusNode;
  TextEditingController? option4TextController;
  String? Function(BuildContext, String?)? option4TextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleThreadsFocusNode?.dispose();
    titleThreadsTextController?.dispose();

    textThreadFocusNode?.dispose();
    textThreadTextController?.dispose();

    titleFocusNode1?.dispose();
    titleTextController1?.dispose();

    titleFocusNode2?.dispose();
    titleTextController2?.dispose();

    option3FocusNode?.dispose();
    option3TextController?.dispose();

    option4FocusNode?.dispose();
    option4TextController?.dispose();
  }
}
