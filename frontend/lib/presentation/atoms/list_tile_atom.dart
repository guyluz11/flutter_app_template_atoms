import 'package:flutter/material.dart';
import 'package:flutter_app_template_atoms/domain/global_variables/global_functions.dart';
import 'package:flutter_app_template_atoms/presentation/atoms/atoms.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListTileAtom extends StatelessWidget {
  const ListTileAtom(
    this.title, {
    this.titleIcon,
    this.trailing,
    this.leading,
    this.subtitle,
    this.translateTitle = true,
    this.translateSubtitle = true,
    this.onTap,
    this.enable = true,
  });

  final String title;
  final IconData? titleIcon;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final bool translateTitle;
  final bool translateSubtitle;
  final VoidCallback? onTap;
  final bool enable;

  Future onTapLocal() async {
    if (onTap == null) {
      return;
    }
    await tapWithSoundAndVibration();
    onTap!();
  }

  @override
  Widget build(BuildContext context) {
    Widget titleWidget;
    titleWidget = TextAtom(title, translate: translateTitle);

    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return ListTile(
      enabled: enable,
      title: titleIcon == null
          ? titleWidget
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child:
                      FaIcon(titleIcon, size: textTheme.bodyMedium!.fontSize),
                ),
                const SeparatorAtom(variant: SeparatorVariant.relatedElements),
                Flexible(child: titleWidget),
              ],
            ),
      subtitle: subtitle == null
          ? null
          : TextAtom(subtitle!, translate: translateSubtitle),
      leading: leading,
      trailing: trailing,
      onTap: onTapLocal,
    );
  }
}
