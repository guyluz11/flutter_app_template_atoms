import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';

class MarkdownAtom extends StatelessWidget {
  const MarkdownAtom(
    this.data, {
    super.key,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    // Create a custom MarkdownConfig to remove dividers after headers
    final config = MarkdownConfig.defaultConfig.copy(
      configs: [
        _CustomH1Config(),
        _CustomH2Config(),
        _CustomH3Config(),
        _CustomH4Config(),
        _CustomH5Config(),
        CodeConfig(
            style: TextStyle(
          backgroundColor: colorScheme.surfaceContainerHigh,
        ))
      ],
    );

    return MarkdownWidget(
      data: data,
      config: config,
      shrinkWrap: true,
    );
  }
}

class _CustomH1Config extends H1Config {
  @override
  HeadingDivider? get divider => null;
}

class _CustomH2Config extends H2Config {
  @override
  HeadingDivider? get divider => null;
}

class _CustomH3Config extends H3Config {
  @override
  HeadingDivider? get divider => null;
}

class _CustomH4Config extends H4Config {
  @override
  HeadingDivider? get divider => null;
}

class _CustomH5Config extends H5Config {
  @override
  HeadingDivider? get divider => null;
}
