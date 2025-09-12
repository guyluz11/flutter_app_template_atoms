import 'package:flutter/material.dart';
import 'package:flutter_app_template_atoms/presentation/core/theme_data.dart';

class CardAtom extends StatelessWidget {
  const CardAtom({
    required this.child,
    this.image,
    this.imageColor,
    this.padding = true,
    this.expandChild = false,
    super.key,
  });

  final Widget child;
  final Image? image;
  final Color? imageColor;
  final bool padding;
  final bool expandChild;

  @override
  Widget build(BuildContext context) {
    Widget content = padding
        ? Padding(
            padding: const EdgeInsets.all(AppThemeData.generalSpacing),
            child: child,
          )
        : child;

    if (expandChild && image != null) {
      content = Expanded(child: content);
    }

    if (image != null) {
      return Card.filled(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: imageColor,
              child: image,
            ),
            content,
          ],
        ),
      );
    }

    return Card.filled(
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      child: content,
    );
  }
}
