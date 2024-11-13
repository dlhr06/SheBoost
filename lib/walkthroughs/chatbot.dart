import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/w_t_card_type_widget.dart';
import '/components/w_t_card_upload_widget.dart';
import '/components/w_t_card_preview_widget.dart';
import '/components/w_t_card_boost_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

// Focus widget keys for this walkthrough
final container7n33n4wm = GlobalKey();
final buttonO5tdgqy7 = GlobalKey();
final pdfViewerVxc4nwhx = GlobalKey();
final button2kp2pu4p = GlobalKey();

/// Chatbot
///
/// Describe how to use the chatbot
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: container7n33n4wm,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).alternate,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WTCardTypeWidget(),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: buttonO5tdgqy7,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).alternate,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WTCardUploadWidget(),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: pdfViewerVxc4nwhx,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).alternate,
        contents: [
          TargetContent(
            align: ContentAlign.right,
            builder: (context, __) => WTCardPreviewWidget(),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: button2kp2pu4p,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: FlutterFlowTheme.of(context).alternate,
        contents: [
          TargetContent(
            align: ContentAlign.right,
            builder: (context, __) => WTCardBoostWidget(),
          ),
        ],
      ),
    ];
