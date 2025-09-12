import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LockedWidget extends StatelessWidget {
  const LockedWidget({
    required this.child,
    super.key,
    this.isGuest = false,
  });
  final Widget child;
  final bool isGuest;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;

    if (isGuest) {
      return GestureDetector(
        onTap: () {},
        child: Stack(
          alignment: Alignment.center,
          children: [
            AbsorbPointer(
              child: child,
            ),
            Positioned.fill(
              child: Container(
                color: colorScheme.surface.withValues(alpha: 0.7),
              ),
            ),
            Align(
              alignment: const FractionalOffset(2 / 3, 0.5),
              child: FaIcon(
                FontAwesomeIcons.userGroup,
                color: colorScheme.onSurface,
              ),
            ),
          ],
        ),
      );
    }
    return child;
  }
}
