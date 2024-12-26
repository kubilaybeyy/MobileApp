import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'loading_animation_model.dart';
export 'loading_animation_model.dart';

class LoadingAnimationWidget extends StatefulWidget {
  const LoadingAnimationWidget({super.key});

  @override
  State<LoadingAnimationWidget> createState() => _LoadingAnimationWidgetState();
}

class _LoadingAnimationWidgetState extends State<LoadingAnimationWidget> {
  late LoadingAnimationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingAnimationModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      while (_model.point != 10) {
        await Future.delayed(const Duration(milliseconds: 1000));
        _model.point = _model.point + 1;
        safeSetState(() {});
        await Future.delayed(const Duration(milliseconds: 1000));
        _model.point = _model.point + 1;
        safeSetState(() {});
        await Future.delayed(const Duration(milliseconds: 1000));
        _model.point = _model.point + 1;
        safeSetState(() {});
        await Future.delayed(const Duration(milliseconds: 1000));
        _model.point = 0;
        safeSetState(() {});
      }
    });

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
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: double.infinity,
        height: 40.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: RichText(
            textScaler: MediaQuery.of(context).textScaler,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Your order is being prepared',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        color: FlutterFlowTheme.of(context).tertiary,
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                      ),
                ),
                TextSpan(
                  text: _model.point > 0 ? '.' : ' ',
                  style: TextStyle(),
                ),
                TextSpan(
                  text: _model.point > 1 ? '.' : '  ',
                  style: TextStyle(),
                ),
                TextSpan(
                  text: _model.point > 2 ? '.' : '  ',
                  style: TextStyle(),
                )
              ],
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Inter',
                    color: FlutterFlowTheme.of(context).tertiary,
                    fontSize: 16.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
