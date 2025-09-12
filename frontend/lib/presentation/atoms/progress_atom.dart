import 'package:flutter/material.dart';
import 'package:flutter_app_template_atoms/presentation/core/global_variables.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class ProgressAtom extends StatefulWidget {
  const ProgressAtom({
    required this.totalDuration,
    this.inputController,
    this.manageProgressFromParent = false,
    this.centerWidget,
    this.initialValue,
    this.progress,
  });

  final Duration totalDuration;
  final AnimationController? inputController;
  final bool manageProgressFromParent;
  final Widget? centerWidget;
  final Duration? initialValue;
  final double? progress; // 0.0 to 1.0

  @override
  State<ProgressAtom> createState() => _ProgressAtomState();
}

class _ProgressAtomState extends State<ProgressAtom>
    with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    initiateController();
    super.initState();
  }

  void initiateController() {
    final double initialValueRatio =
        (widget.initialValue?.inMilliseconds ?? 0) /
            widget.totalDuration.inMilliseconds;

    controller = widget.inputController ??
        AnimationController(
          vsync: this,
          duration: widget.totalDuration,
          value: initialValueRatio,
        );
    controller.addListener(() {
      setState(() {});
    });

    if (!widget.manageProgressFromParent) {
      controller.forward();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;
    double value = 0.0;
    if (widget.manageProgressFromParent) {
      value = widget.progress ?? 0.0;
    } else {
      value = controller.value;
    }
    return SizedBox(
      width: double.infinity,
      height: 35,
      child: LiquidLinearProgressIndicator(
        value: value,
        backgroundColor: colorScheme.secondaryContainer,
        valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
        borderColor: colorScheme.outline,
        borderRadius: GlobalVariables.defaultRadius,
        borderWidth: GlobalVariables.defaultBorderWidth,
        center: widget.centerWidget,
      ),
    );
  }
}
