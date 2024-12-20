import 'package:flutter/material.dart';
import 'package:flutter_app_template_atoms/domain/controllers/controllers.dart';
import 'package:flutter_app_template_atoms/presentation/atoms/atoms.dart';
import 'package:flutter_app_template_atoms/presentation/core/global_variables.dart';
import 'package:flutter_app_template_atoms/presentation/core/theme_data.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  Future initializeApp() async {
    await PreferencesController.instance.init();
    PlayerController.instance.init();
    await VibrationController.instance.init();
    NotificationsController.instance.init();
    final int loginCounter =
        PreferencesController.instance.getInt(PreferenceKeys.loginCounter) ?? 0;
    PreferencesController.instance
        .setInt(PreferenceKeys.loginCounter, loginCounter + 1);

    _navigate();
  }

  Future _navigate() async {
    // TODO: Choose your home page
    // Navigator.of(context).pop();
    //
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => HomePage(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: AppThemeData.logoBackgroundColor,
        child: Center(
          child: ButtonAtom(
            variant: ButtonVariant.highEmphasisFilled,
            onPressed: () {},
            text: GlobalVariables.appName,
          ),
          // TODO: Add your product logo
          // ImageAtom(
          //   'assets/logo.png',
          //   hero: 'full_logo',
          // ),
        ),
      ),
    );
  }
}
