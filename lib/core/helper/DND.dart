import 'package:flutter/services.dart';

class DoNotDisturb {
  static const platform = MethodChannel('com.example.dnd');

  static Future<void> enableDND() async {
    try {
      await platform.invokeMethod('enableDND');
    } on PlatformException catch (e) {
      print("Failed to enable DND: '${e.message}'.");
    }
  }

  static Future<void> disableDND() async {
    try {
      await platform.invokeMethod('disableDND');
    } on PlatformException catch (e) {
      print("Failed to disable DND: '${e.message}'.");
    }
  }
}
