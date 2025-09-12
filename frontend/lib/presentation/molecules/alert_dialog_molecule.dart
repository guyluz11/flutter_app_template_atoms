import 'package:flutter/material.dart';
import 'package:flutter_app_template_atoms/presentation/atoms/atoms.dart';
import 'package:flutter_app_template_atoms/presentation/core/global_variables.dart';
import 'package:flutter_app_template_atoms/presentation/core/theme_data.dart';

void openAlertDialog(
  BuildContext context,
  Widget body, {
  VoidCallback? onConfirm,
  String? confirmButtonText,
  String? closeButtonText,
  bool showCloseButton = true,
  bool barrierDismissible = true,
}) {
  showDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (_) => PopScope(
      canPop: barrierDismissible,
      child: DialogMolecule(
        body,
        onConfirm: onConfirm,
        confirmButtonText: confirmButtonText,
        closeButtonText: closeButtonText,
        showCloseButton: showCloseButton,
      ),
    ),
  );
}

class DialogMolecule extends StatelessWidget {
  const DialogMolecule(
    this.body, {
    required this.showCloseButton,
    this.onConfirm,
    this.closeButtonText,
    this.confirmButtonText,
  });

  final Widget body;
  final VoidCallback? onConfirm;
  final String? confirmButtonText;
  final String? closeButtonText;
  final bool showCloseButton;

  void onConfirmButton(BuildContext context) {
    if (onConfirm != null) {
      return onConfirm!.call();
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding:
          const EdgeInsets.only(bottom: AppThemeData.generalSpacing),
      insetPadding: const EdgeInsets.all(AppThemeData.generalSpacing),
      content: Container(
        width: double.infinity,
        constraints: GlobalVariables.maxWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SeparatorAtom(),
            body,
            const SeparatorAtom(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (showCloseButton)
                      ButtonAtom(
                        variant: ButtonVariant.highEmphasisFilled,
                        onPressed: () => Navigator.pop(context),
                        text: closeButtonText ?? 'close',
                      ),
                    if (confirmButtonText != null) ...[
                      const SeparatorAtom(),
                      ButtonAtom(
                        variant: showCloseButton
                            ? ButtonVariant.mediumEmphasisOutlined
                            : ButtonVariant.highEmphasisFilled,
                        onPressed: () => onConfirmButton(context),
                        text: confirmButtonText,
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
