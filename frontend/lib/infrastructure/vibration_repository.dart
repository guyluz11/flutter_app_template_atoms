part of 'package:flutter_app_template_atoms/domain/controllers/vibration_controller.dart';

class _VibrationRepository extends VibrationController {
  @override
  Future init() async => supported = Platform.isAndroid || Platform.isIOS;

  @override
  Future vibrate(VibrationType type) async {
    if (!supported) {
      return;
    }

    switch (type) {
      case VibrationType.light:
        Vibration.vibrate(amplitude: 30, duration: 50);
      case VibrationType.medium:
        Vibration.vibrate(duration: 501);
      case VibrationType.heavy:
        Vibration.vibrate(duration: 1000);
    }
  }
}
