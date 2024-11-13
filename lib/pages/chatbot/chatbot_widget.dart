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
import 'chatbot_model.dart';
export 'chatbot_model.dart';

class ChatbotWidget extends StatefulWidget {
  const ChatbotWidget({super.key});

  @override
  State<ChatbotWidget> createState() => _ChatbotWidgetState();
}

class _ChatbotWidgetState extends State<ChatbotWidget> {
  late ChatbotModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatbotModel());

    _model.inputPromptTextController ??= TextEditingController();
    _model.inputPromptFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Chatbot',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  wrapWithModel(
                    model: _model.topbarModel,
                    updateCallback: () => safeSetState(() {}),
                    child: TopbarWidget(),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          0.0,
                          valueOrDefault<double>(
                            MediaQuery.sizeOf(context).width <= kBreakpointSmall
                                ? 0.0
                                : 24.0,
                            24.0,
                          ),
                          0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                          ))
                            Material(
                              color: Colors.transparent,
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: SafeArea(
                                child: Container(
                                  width: 280.0,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.93,
                                  constraints: BoxConstraints(
                                    minHeight:
                                        MediaQuery.sizeOf(context).height *
                                            0.85,
                                    maxHeight: double.infinity,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(0.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 16.0, 12.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 24.0, 0.0, 16.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                if (!_model.reviewChat) {
                                                  // updateChat
                                                  _model.addToChats(
                                                      _model.chatHistory!);
                                                  safeSetState(() {});
                                                  FFAppState()
                                                      .addToConversations(
                                                          _model.chatHistory!);
                                                  safeSetState(() {});
                                                }
                                                _model.chatHistory = null;
                                                _model.reviewChat = false;
                                                safeSetState(() {});
                                              },
                                              text: 'New Chat',
                                              icon: Icon(
                                                Icons.chat,
                                                size: 15.0,
                                              ),
                                              options: FFButtonOptions(
                                                width: 150.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0xFF3B8AC4),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(40.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Text(
                                            'Recent Chats',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMediumFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMediumFamily),
                                                ),
                                          ),
                                        ),
                                        Flexible(
                                          flex: 1,
                                          child: Container(
                                            height: double.infinity,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 16.0, 16.0, 16.0),
                                              child: Builder(
                                                builder: (context) {
                                                  final conversations =
                                                      _model.chats.toList();

                                                  return SingleChildScrollView(
                                                    controller:
                                                        _model.columnController,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: List.generate(
                                                          conversations.length,
                                                          (conversationsIndex) {
                                                        final conversationsItem =
                                                            conversations[
                                                                conversationsIndex];
                                                        return InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model.chatHistory =
                                                                _model.chats[
                                                                    conversationsIndex];
                                                            _model.reviewChat =
                                                                true;
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            height: 35.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          10.0,
                                                                          0.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  _model
                                                                      .chatHistory = _model
                                                                          .chats[
                                                                      conversationsIndex];
                                                                  _model.reviewChat =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .chat_bubble_outline,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                    Text(
                                                                      'Chat ${(conversationsIndex + 1).toString()}',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelMediumFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          12.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Divider(
                                                thickness: 2.0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 16.0, 16.0, 16.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    var _shouldSetState = false;
                                                    final selectedFiles =
                                                        await selectFiles(
                                                      allowedExtensions: [
                                                        'pdf'
                                                      ],
                                                      multiFile: false,
                                                    );
                                                    if (selectedFiles != null) {
                                                      safeSetState(() => _model
                                                              .isDataUploading =
                                                          true);
                                                      var selectedUploadedFiles =
                                                          <FFUploadedFile>[];

                                                      try {
                                                        selectedUploadedFiles =
                                                            selectedFiles
                                                                .map((m) =>
                                                                    FFUploadedFile(
                                                                      name: m
                                                                          .storagePath
                                                                          .split(
                                                                              '/')
                                                                          .last,
                                                                      bytes: m
                                                                          .bytes,
                                                                    ))
                                                                .toList();
                                                      } finally {
                                                        _model.isDataUploading =
                                                            false;
                                                      }
                                                      if (selectedUploadedFiles
                                                              .length ==
                                                          selectedFiles
                                                              .length) {
                                                        safeSetState(() {
                                                          _model.uploadedLocalFile =
                                                              selectedUploadedFiles
                                                                  .first;
                                                        });
                                                      } else {
                                                        safeSetState(() {});
                                                        return;
                                                      }
                                                    }

                                                    _model.uploadedGemFile =
                                                        await GeminiUploadCall
                                                            .call(
                                                      file: _model
                                                          .uploadedLocalFile,
                                                    );

                                                    _shouldSetState = true;
                                                    if ((_model.uploadedGemFile
                                                            ?.succeeded ??
                                                        true)) {
                                                      _model.fileUri =
                                                          getJsonField(
                                                        (_model.uploadedGemFile
                                                                ?.jsonBody ??
                                                            ''),
                                                        r'''$["file"]["uri"]''',
                                                      ).toString();
                                                      safeSetState(() {});
                                                      _model
                                                          .isFileUploaded = _model
                                                                  .uploadedLocalFile !=
                                                              null &&
                                                          (_model
                                                                  .uploadedLocalFile
                                                                  .bytes
                                                                  ?.isNotEmpty ??
                                                              false);
                                                      safeSetState(() {});
                                                    } else {
                                                      safeSetState(() {
                                                        _model.isDataUploading =
                                                            false;
                                                        _model.uploadedLocalFile =
                                                            FFUploadedFile(
                                                                bytes: Uint8List
                                                                    .fromList(
                                                                        []));
                                                      });

                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Error trying to upload file',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLargeFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleLargeFamily),
                                                                ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              Color(0xFFF1AFB3),
                                                        ),
                                                      );
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }

                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                  },
                                                  text: _model.isFileUploaded
                                                      ? 'Change File'
                                                      : 'Upload Resume',
                                                  icon: Icon(
                                                    Icons.upload_file,
                                                    size: 15.0,
                                                  ),
                                                  options: FFButtonOptions(
                                                    width: 150.0,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: Colors.transparent,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .labelLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLargeFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily),
                                                        ),
                                                    elevation: 0.0,
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40.0),
                                                  ),
                                                ).addWalkthrough(
                                                  buttonO5tdgqy7,
                                                  _model.chatbotController,
                                                ),
                                              ),
                                              if (_model.isFileUploaded == true)
                                                FlutterFlowPdfViewer(
                                                  fileBytes: _model
                                                      .uploadedLocalFile.bytes,
                                                  width: double.infinity,
                                                  height: 350.0,
                                                  horizontalScroll: true,
                                                ).addWalkthrough(
                                                  pdfViewerVxc4nwhx,
                                                  _model.chatbotController,
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: SafeArea(
                                  child: Container(
                                    width: double.infinity,
                                    constraints: BoxConstraints(
                                      minHeight:
                                          MediaQuery.sizeOf(context).height *
                                              0.85,
                                      maxWidth: 750.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.all(valueOrDefault<double>(
                                        MediaQuery.sizeOf(context).width <
                                                kBreakpointSmall
                                            ? 0.0
                                            : 10.0,
                                        0.0,
                                      )),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12.0, 12.0,
                                                          12.0, 12.0),
                                                  child: AutoSizeText(
                                                    'Profesional Boost Chat AI',
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineMediumFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          fontSize: 22.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMediumFamily),
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12.0,
                                                                12.0,
                                                                12.0,
                                                                0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      child: BackdropFilter(
                                                        filter:
                                                            ImageFilter.blur(
                                                          sigmaX: 5.0,
                                                          sigmaY: 4.0,
                                                        ),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFF5F8F8),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final chat = _model
                                                                        .chatHistory
                                                                        ?.toList() ??
                                                                    [];
                                                                if (chat
                                                                    .isEmpty) {
                                                                  return Container(
                                                                    width: double
                                                                        .infinity,
                                                                    child:
                                                                        InitialCardWidget(),
                                                                  );
                                                                }

                                                                return ListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .fromLTRB(
                                                                    0,
                                                                    10.0,
                                                                    0,
                                                                    10.0,
                                                                  ),
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount: chat
                                                                      .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          chatIndex) {
                                                                    final chatItem =
                                                                        chat[
                                                                            chatIndex];
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          if (chatIndex % 2 ==
                                                                              0)
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                Container(
                                                                                  constraints: BoxConstraints(
                                                                                    maxWidth: () {
                                                                                      if (MediaQuery.sizeOf(context).width >= 1170.0) {
                                                                                        return 700.0;
                                                                                      } else if (MediaQuery.sizeOf(context).width <= 470.0) {
                                                                                        return 330.0;
                                                                                      } else {
                                                                                        return 530.0;
                                                                                      }
                                                                                    }(),
                                                                                  ),
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(12.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          getJsonField(
                                                                                            chatItem,
                                                                                            r'''$['parts'][0]['text']''',
                                                                                          ).toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                color: Color(0xFF333333),
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          if (valueOrDefault<
                                                                              bool>(
                                                                            (int
                                                                                index) {
                                                                              return index % 2 != 0;
                                                                            }(chatIndex),
                                                                            false,
                                                                          ))
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(12.0),
                                                                                      child: Container(
                                                                                        constraints: BoxConstraints(
                                                                                          maxWidth: () {
                                                                                            if (MediaQuery.sizeOf(context).width >= 1170.0) {
                                                                                              return 600.0;
                                                                                            } else if (MediaQuery.sizeOf(context).width <= 470.0) {
                                                                                              return 330.0;
                                                                                            } else {
                                                                                              return 530.0;
                                                                                            }
                                                                                          }(),
                                                                                        ),
                                                                                        decoration: BoxDecoration(
                                                                                          color: valueOrDefault<Color>(
                                                                                            (String msg) {
                                                                                              return msg == "AI is unable to answer that for safety reasons" || msg == "There was a problem connecting to Gemini";
                                                                                            }(getJsonField(
                                                                                              chatItem,
                                                                                              r'''$["parts"][0]['text']''',
                                                                                            ).toString())
                                                                                                ? Color(0xFF9BB5AF)
                                                                                                : FlutterFlowTheme.of(context).secondary,
                                                                                            FlutterFlowTheme.of(context).secondary,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 15.0, 12.0, 15.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              MarkdownBody(
                                                                                                data: getJsonField(
                                                                                                  chatItem,
                                                                                                  r'''$['parts'][0]['text']''',
                                                                                                ).toString(),
                                                                                                selectable: true,
                                                                                                onTapLink: (_, url, __) => launchURL(url!),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          await Clipboard.setData(ClipboardData(
                                                                                              text: getJsonField(
                                                                                            chatItem,
                                                                                            r'''$['parts'][0]['text']''',
                                                                                          ).toString()));
                                                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                                                            SnackBar(
                                                                                              content: Text(
                                                                                                'Response copied to clipboard.',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                              ),
                                                                                              duration: Duration(milliseconds: 2000),
                                                                                              backgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                              child: Icon(
                                                                                                Icons.content_copy,
                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                size: 10.0,
                                                                                              ),
                                                                                            ),
                                                                                            InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                await Clipboard.setData(ClipboardData(
                                                                                                    text: getJsonField(
                                                                                                  chatItem,
                                                                                                  r'''$["parts"][0]['text']''',
                                                                                                ).toString()));
                                                                                                ScaffoldMessenger.of(context).showSnackBar(
                                                                                                  SnackBar(
                                                                                                    content: Text(
                                                                                                      'Response copied!',
                                                                                                      style: TextStyle(
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      ),
                                                                                                    ),
                                                                                                    duration: Duration(milliseconds: 4000),
                                                                                                    backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                              child: Text(
                                                                                                'Copy response',
                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  },
                                                                  controller: _model
                                                                      .listViewController,
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 12.0, 12.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                if (_model.isFileUploaded ==
                                                    true)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        safeSetState(() {
                                                          _model.isDataUploading =
                                                              false;
                                                          _model.uploadedLocalFile =
                                                              FFUploadedFile(
                                                                  bytes: Uint8List
                                                                      .fromList(
                                                                          []));
                                                        });

                                                        _model.isFileUploaded =
                                                            !_model
                                                                .isFileUploaded;
                                                        safeSetState(() {});
                                                      },
                                                      text: 'Remove  File',
                                                      icon: Icon(
                                                        Icons
                                                            .delete_forever_sharp,
                                                        size: 15.0,
                                                      ),
                                                      options: FFButtonOptions(
                                                        width: 150.0,
                                                        height: 40.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily),
                                                                ),
                                                        elevation: 2.0,
                                                        borderSide: BorderSide(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .error,
                                                          width: 0.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20.0),
                                                      ),
                                                    ),
                                                  ),
                                                if (responsiveVisibility(
                                                  context: context,
                                                  phone: false,
                                                ))
                                                  AlignedTooltip(
                                                    content: Padding(
                                                      padding:
                                                          EdgeInsets.all(10.0),
                                                      child: Text(
                                                        'Use file into current conversation',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                    offset: 4.0,
                                                    preferredDirection:
                                                        AxisDirection.up,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    elevation: 4.0,
                                                    tailBaseWidth: 24.0,
                                                    tailLength: 12.0,
                                                    waitDuration: Duration(
                                                        milliseconds: 100),
                                                    showDuration: Duration(
                                                        milliseconds: 1000),
                                                    triggerMode:
                                                        TooltipTriggerMode.tap,
                                                    child: Visibility(
                                                      visible: (_model
                                                                  .isFileUploaded ==
                                                              true) &&
                                                          _model
                                                              .isResumeBoosted,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          borderRadius: 8.0,
                                                          borderWidth: 2.0,
                                                          buttonSize: 40.0,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          icon: Icon(
                                                            Icons
                                                                .auto_awesome_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                          ),
                                                          onPressed: () async {
                                                            _model.chatHistory = functions.updateContext(
                                                                _model
                                                                    .chatHistory,
                                                                functions.convertPromptToJSON(
                                                                    _model.inputPromptTextController.text ==
                                                                                null ||
                                                                            _model.inputPromptTextController.text ==
                                                                                ''
                                                                        ? 'Boost my resume, please!'
                                                                        : _model
                                                                            .inputPromptTextController
                                                                            .text,
                                                                    _model
                                                                        .fileUri));
                                                            safeSetState(() {});
                                                            _model.boostResponse2 =
                                                                await GeminiGenerateTextCall
                                                                    .call(
                                                              contextJson: functions
                                                                  .chatContext(
                                                                      _model
                                                                          .chatHistory),
                                                            );

                                                            if ((_model
                                                                    .boostResponse2
                                                                    ?.succeeded ??
                                                                true)) {
                                                              if ((String
                                                                  response) {
                                                                return response
                                                                    .contains(
                                                                        "unable to enhance");
                                                              }(getJsonField(
                                                                (_model.boostResponse2
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$['data']''',
                                                              ).toString())) {
                                                                _model.chatHistory = functions.updateContext(
                                                                    _model
                                                                        .chatHistory,
                                                                    functions.convertResponseToJSON(
                                                                        FFAppConstants
                                                                            .NotResumeError));
                                                                safeSetState(
                                                                    () {});
                                                                safeSetState(
                                                                    () {
                                                                  _model.isDataUploading =
                                                                      false;
                                                                  _model.uploadedLocalFile =
                                                                      FFUploadedFile(
                                                                          bytes:
                                                                              Uint8List.fromList([]));
                                                                });

                                                                // CV is not boosted
                                                                _model.isResumeBoosted =
                                                                    false;
                                                                _model.fileUri =
                                                                    null;
                                                                _model.isFileUploaded =
                                                                    !_model
                                                                        .isFileUploaded;
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                _model.chatHistory = functions
                                                                    .updateContext(
                                                                        _model
                                                                            .chatHistory,
                                                                        functions
                                                                            .convertResponseToJSON(getJsonField(
                                                                          (_model.boostResponse2?.jsonBody ??
                                                                              ''),
                                                                          r'''$["data"]''',
                                                                        ).toString()));
                                                                safeSetState(
                                                                    () {});
                                                                // CV is boosted
                                                                _model.isResumeBoosted =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              }

                                                              safeSetState(() {
                                                                _model
                                                                    .inputPromptTextController
                                                                    ?.clear();
                                                              });
                                                            } else {
                                                              // Connection Failed Msg
                                                              _model.chatHistory = functions.updateContext(
                                                                  _model
                                                                      .chatHistory,
                                                                  functions.convertResponseToJSON(
                                                                      FFAppConstants
                                                                          .GeminiErrorConection));
                                                              safeSetState(
                                                                  () {});
                                                            }

                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        1000));
                                                            await _model
                                                                .listViewController
                                                                ?.animateTo(
                                                              _model
                                                                  .listViewController!
                                                                  .position
                                                                  .maxScrollExtent,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      100),
                                                              curve:
                                                                  Curves.ease,
                                                            );

                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 0.0
                                                          : 12.0,
                                                      0.0,
                                                    ),
                                                    12.0,
                                                    valueOrDefault<double>(
                                                      MediaQuery.sizeOf(context)
                                                                  .width <
                                                              kBreakpointSmall
                                                          ? 0.0
                                                          : 12.0,
                                                      0.0,
                                                    ),
                                                    12.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 3.0,
                                                    color: Color(0x33000000),
                                                    offset: Offset(
                                                      0.0,
                                                      1.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        20.0, 4.0, 10.0, 4.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        width: double.infinity,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .inputPromptTextController,
                                                          focusNode: _model
                                                              .inputPromptFocusNode,
                                                          autofocus: true,
                                                          textCapitalization:
                                                              TextCapitalization
                                                                  .sentences,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            hintText:
                                                                'Type something...',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                            enabledBorder:
                                                                InputBorder
                                                                    .none,
                                                            focusedBorder:
                                                                InputBorder
                                                                    .none,
                                                            errorBorder:
                                                                InputBorder
                                                                    .none,
                                                            focusedErrorBorder:
                                                                InputBorder
                                                                    .none,
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                          maxLines: null,
                                                          minLines: 1,
                                                          keyboardType:
                                                              TextInputType
                                                                  .multiline,
                                                          validator: _model
                                                              .inputPromptTextControllerValidator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                    if ((_model.isFileUploaded ==
                                                            true) &&
                                                        !_model.isResumeBoosted)
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            _model.chatHistory = functions.updateContext(
                                                                _model
                                                                    .chatHistory,
                                                                functions.convertPromptToJSON(
                                                                    _model.inputPromptTextController.text ==
                                                                                null ||
                                                                            _model.inputPromptTextController.text ==
                                                                                ''
                                                                        ? 'Boost my resume, please!'
                                                                        : _model
                                                                            .inputPromptTextController
                                                                            .text,
                                                                    _model
                                                                        .fileUri));
                                                            safeSetState(() {});
                                                            _model.boostResponse =
                                                                await GeminiGenerateTextCall
                                                                    .call(
                                                              contextJson: functions
                                                                  .chatContext(
                                                                      _model
                                                                          .chatHistory),
                                                            );

                                                            if ((_model
                                                                    .boostResponse
                                                                    ?.succeeded ??
                                                                true)) {
                                                              if ((String
                                                                  response) {
                                                                return response
                                                                    .contains(
                                                                        "unable to enhance");
                                                              }(getJsonField(
                                                                (_model.boostResponse
                                                                        ?.jsonBody ??
                                                                    ''),
                                                                r'''$['data']''',
                                                              ).toString())) {
                                                                _model.chatHistory = functions.updateContext(
                                                                    _model
                                                                        .chatHistory,
                                                                    functions.convertResponseToJSON(
                                                                        FFAppConstants
                                                                            .NotResumeError));
                                                                safeSetState(
                                                                    () {});
                                                                safeSetState(
                                                                    () {
                                                                  _model.isDataUploading =
                                                                      false;
                                                                  _model.uploadedLocalFile =
                                                                      FFUploadedFile(
                                                                          bytes:
                                                                              Uint8List.fromList([]));
                                                                });

                                                                // CV is not boosted
                                                                _model.isResumeBoosted =
                                                                    false;
                                                                _model.fileUri =
                                                                    null;
                                                                _model.isFileUploaded =
                                                                    !_model
                                                                        .isFileUploaded;
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                _model.chatHistory = functions
                                                                    .updateContext(
                                                                        _model
                                                                            .chatHistory,
                                                                        functions
                                                                            .convertResponseToJSON(getJsonField(
                                                                          (_model.boostResponse?.jsonBody ??
                                                                              ''),
                                                                          r'''$["data"]''',
                                                                        ).toString()));
                                                                safeSetState(
                                                                    () {});
                                                                // CV is boosted
                                                                _model.isResumeBoosted =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              }

                                                              safeSetState(() {
                                                                _model
                                                                    .inputPromptTextController
                                                                    ?.clear();
                                                              });
                                                            } else {
                                                              // Connection Failed Msg
                                                              _model.chatHistory = functions.updateContext(
                                                                  _model
                                                                      .chatHistory,
                                                                  functions.convertResponseToJSON(
                                                                      FFAppConstants
                                                                          .GeminiErrorConection));
                                                              safeSetState(
                                                                  () {});
                                                            }

                                                            await Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        1000));
                                                            await _model
                                                                .listViewController
                                                                ?.animateTo(
                                                              _model
                                                                  .listViewController!
                                                                  .position
                                                                  .maxScrollExtent,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      100),
                                                              curve:
                                                                  Curves.ease,
                                                            );

                                                            safeSetState(() {});
                                                          },
                                                          text: 'Boost',
                                                          icon: Icon(
                                                            Icons
                                                                .auto_awesome_rounded,
                                                            size: 15.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLarge
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelLargeFamily),
                                                                    ),
                                                            elevation: 2.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              width: 2.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0),
                                                          ),
                                                        ).addWalkthrough(
                                                          button2kp2pu4p,
                                                          _model
                                                              .chatbotController,
                                                        ),
                                                      ),
                                                    if (!((_model
                                                                .isResumeBoosted ==
                                                            false) &&
                                                        (_model.isFileUploaded ==
                                                            true)))
                                                      FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 60.0,
                                                        icon: Icon(
                                                          Icons.send_rounded,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 30.0,
                                                        ),
                                                        showLoadingIndicator:
                                                            true,
                                                        onPressed: () async {
                                                          _model.chatHistory = functions.updateContext(
                                                              _model
                                                                  .chatHistory,
                                                              functions.convertPromptToJSON(
                                                                  _model
                                                                      .inputPromptTextController
                                                                      .text,
                                                                  (_model.isFileUploaded ==
                                                                              true) &&
                                                                          (_model.fileUri != null &&
                                                                              _model.fileUri !=
                                                                                  '') &&
                                                                          !_model
                                                                              .isResumeBoosted
                                                                      ? _model
                                                                          .fileUri
                                                                      : null));
                                                          safeSetState(() {});
                                                          _model.geminiResponseCopy =
                                                              await GeminiGenerateTextCall
                                                                  .call(
                                                            contextJson: functions
                                                                .chatContext(_model
                                                                    .chatHistory),
                                                          );

                                                          if ((_model
                                                                  .geminiResponseCopy
                                                                  ?.succeeded ??
                                                              true)) {
                                                            _model.chatHistory = functions
                                                                .updateChatHistory(
                                                                    _model
                                                                        .chatHistory,
                                                                    functions
                                                                        .convertResponseToJSON(
                                                                            getJsonField(
                                                                      (_model.geminiResponseCopy
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                      r'''$["data"]''',
                                                                    ).toString()));
                                                            safeSetState(() {});
                                                          } else {
                                                            _model.chatHistory =
                                                                functions.updateContext(
                                                                    _model
                                                                        .chatHistory,
                                                                    functions
                                                                        .convertResponseToJSON(
                                                                            '\"There was a problem connecting to Gemini\"'));
                                                            safeSetState(() {});
                                                          }

                                                          safeSetState(() {
                                                            _model
                                                                .inputPromptTextController
                                                                ?.clear();
                                                          });
                                                          await Future.delayed(
                                                              const Duration(
                                                                  milliseconds:
                                                                      800));
                                                          await _model
                                                              .listViewController
                                                              ?.animateTo(
                                                            _model
                                                                .listViewController!
                                                                .position
                                                                .maxScrollExtent,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    100),
                                                            curve: Curves.ease,
                                                          );

                                                          safeSetState(() {});
                                                        },
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ).addWalkthrough(
                                              container7n33n4wm,
                                              _model.chatbotController,
                                            ),
                                          ),
                                          AutoSizeText(
                                            'The Chatbot can make mistakes. Check and veriify important info.',
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .labelSmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelSmallFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelSmallFamily),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 12.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.chatbotController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
