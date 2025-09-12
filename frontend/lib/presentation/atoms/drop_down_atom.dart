import 'package:flutter/material.dart';
import 'package:flutter_app_template_atoms/presentation/atoms/atoms.dart';

class DropDownAtom extends StatefulWidget {
  const DropDownAtom({
    required this.options,
    super.key,
    this.initialValue,
    this.onChanged,
  });

  final List<String> options;
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  @override
  _DropDownAtomState createState() => _DropDownAtomState();
}

class _DropDownAtomState extends State<DropDownAtom> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
        if (widget.onChanged != null && value != null) {
          widget.onChanged!(value);
        }
      },
      items: widget.options.map((option) {
        return DropdownMenuItem(
          value: option,
          child: TextAtom(option),
        );
      }).toList(),
    );
  }
}
