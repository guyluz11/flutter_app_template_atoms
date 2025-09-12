import 'package:flutter/material.dart';

enum TextInputVariant {
  text,
  url;

  TextInputType get keyboardType {
    switch (this) {
      case TextInputVariant.text:
        return TextInputType.text;
      case TextInputVariant.url:
        return TextInputType.url;
    }
  }
}

class TextInputAtom extends StatefulWidget {
  const TextInputAtom({
    required this.labelText,
    required this.onChanged,
    super.key,
    this.variant = TextInputVariant.text,
    this.outlined = false,
    this.initialValue,
    this.controller,
    this.enabled = true,
  });

  final String labelText;
  final TextInputVariant variant;
  final bool outlined;
  final void Function(String) onChanged;
  final String? initialValue;
  final TextEditingController? controller;
  final bool enabled;

  @override
  State<TextInputAtom> createState() => _TextInputAtomState();
}

class _TextInputAtomState extends State<TextInputAtom> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
    if (widget.initialValue != null) {
      controller.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.enabled,
      decoration: InputDecoration(
        labelText: widget.labelText,
        border: widget.outlined
            ? const OutlineInputBorder()
            : const UnderlineInputBorder(),
      ),
      keyboardType: widget.variant.keyboardType,
      onChanged: widget.onChanged,
      controller: controller,
    );
  }
}
