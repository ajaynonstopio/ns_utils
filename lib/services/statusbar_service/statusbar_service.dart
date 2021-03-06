import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

const Duration _delayDuration = Duration(milliseconds: 500);

class StatusBarService {
  static Future<Null> hideStatusBar() async {
    await SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  static Future<Null> showStatusBar() async {
    await SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  static Future<Null> changeStatusColor(
    Color color, {
    bool whiteForeground = true,
  }) async {
    try {
      await Future.delayed(_delayDuration);
      await FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
      await Future.delayed(_delayDuration);
      await FlutterStatusbarcolor.setStatusBarWhiteForeground(whiteForeground);
    } on PlatformException catch (e) {
      debugPrint('$e');
    }
  }

  static void resetStatusBarColor() {
    SystemChrome.restoreSystemUIOverlays();
  }
}
