import 'package:flutter/material.dart';
import 'package:flutter_app_template_atoms/presentation/atoms/atoms.dart';

class SnackBarService {
  factory SnackBarService() {
    return _instance;
  }

  SnackBarService._singletonConstructor();

  static final SnackBarService _instance =
      SnackBarService._singletonConstructor();

  /// In milliseconds
  int get defaultTime => 3000;

  void show(
    BuildContext context,
    String text, {
    int? time,
    bool translate = true,
    List<String>? translationArgs,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: TextAtom(
          text,
          translate: translate,
          translationArgs: translationArgs,
        ),
        duration: Duration(milliseconds: time ?? defaultTime),
      ),
    );
  }
}