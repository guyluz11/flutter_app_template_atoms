import 'dart:math';

import 'package:flutter_app_template_atoms/domain/controllers/controllers.dart';

Future tapWithSoundAndVibration() async {
  PlayerController.instance.play(_clickSound(), volume: 0.5);
  VibrationController.instance.vibrate(VibrationType.light);
}

SoundType _clickSound() {
  final random = Random();
  final List<SoundType> clickSound = [
    SoundType.click1,
    SoundType.click2,
    SoundType.click3
  ];
  return clickSound[random.nextInt(clickSound.length)];
}
