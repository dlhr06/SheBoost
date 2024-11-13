import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'initial_card_model.dart';
export 'initial_card_model.dart';

class InitialCardWidget extends StatefulWidget {
  const InitialCardWidget({super.key});

  @override
  State<InitialCardWidget> createState() => _InitialCardWidgetState();
}

class _InitialCardWidgetState extends State<InitialCardWidget> {
  late InitialCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InitialCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(
            valueOrDefault<double>(
              MediaQuery.sizeOf(context).width < kBreakpointSmall ? 10.0 : 32.0,
              10.0,
            ),
            0.0,
            valueOrDefault<double>(
              MediaQuery.sizeOf(context).width < kBreakpointSmall ? 10.0 : 32.0,
              10.0,
            ),
            0.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Start a conversation',
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).headlineMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context)
                                  .headlineMediumFamily),
                        ),
                  ),
                  MarkdownBody(
                    data:
                        '''This chatbot is a proof of concept and uses Artificial Intelligence (AI) to provide assistance and information. Please keep in mind:\n\n1. **AI Limitations**: While designed to be accurate, the chatbot may occasionally make mistakes or misunderstand. It does not replace professional advice. \n\n2. **Responsible Use**: Use the chatbot respectfully. Avoid sharing sensitive or confidential information, and refrain from requesting or discussing illegal, unethical, or harmful activities.\n\n3. **Verify Information**: Although the AI strives for accuracy, please verify critical information independently.\n\nFor more details, see [Google\'s AI Responsability Principples](https://ai.google/responsibility/principles/).\n''',
                    selectable: true,
                    onTapLink: (_, url, __) => launchURL(url!),
                  ),
                  Divider(
                    height: 24.0,
                    thickness: 2.0,
                    color: FlutterFlowTheme.of(context).alternate,
                  ),
                ].divide(SizedBox(height: 10.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
