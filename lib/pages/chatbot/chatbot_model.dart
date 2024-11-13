import '/backend/api_requests/api_calls.dart';
import '/components/initial_card/initial_card_widget.dart';
import '/components/topbar/topbar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/walkthroughs/chatbot.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'chatbot_widget.dart' show ChatbotWidget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ChatbotModel extends FlutterFlowModel<ChatbotWidget> {
  ///  Local state fields for this page.

  dynamic chatHistory;

  String? fileUri = '';

  bool isFileUploaded = false;

  bool isResumeBoosted = false;

  List<dynamic> chats = [];
  void addToChats(dynamic item) => chats.add(item);
  void removeFromChats(dynamic item) => chats.remove(item);
  void removeAtIndexFromChats(int index) => chats.removeAt(index);
  void insertAtIndexInChats(int index, dynamic item) =>
      chats.insert(index, item);
  void updateChatsAtIndex(int index, Function(dynamic) updateFn) =>
      chats[index] = updateFn(chats[index]);

  bool reviewChat = false;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? chatbotController;
  // Model for topbar component.
  late TopbarModel topbarModel;
  // State field(s) for Column widget.
  ScrollController? columnController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Backend Call - API (Gemini Upload)] action in Button widget.
  ApiCallResponse? uploadedGemFile;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // Stores action output result for [Backend Call - API (Gemini GenerateText)] action in IconButton widget.
  ApiCallResponse? boostResponse2;
  // State field(s) for inputPrompt widget.
  FocusNode? inputPromptFocusNode;
  TextEditingController? inputPromptTextController;
  String? Function(BuildContext, String?)? inputPromptTextControllerValidator;
  // Stores action output result for [Backend Call - API (Gemini GenerateText)] action in Button widget.
  ApiCallResponse? boostResponse;
  // Stores action output result for [Backend Call - API (Gemini GenerateText)] action in IconButton widget.
  ApiCallResponse? geminiResponseCopy;

  @override
  void initState(BuildContext context) {
    topbarModel = createModel(context, () => TopbarModel());
    columnController = ScrollController();
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    chatbotController?.finish();
    topbarModel.dispose();
    columnController?.dispose();
    listViewController?.dispose();
    inputPromptFocusNode?.dispose();
    inputPromptTextController?.dispose();
  }
}
