import 'package:flutter/services.dart';

import 'usb_debug_checker_platform_interface.dart';

class UsbDebugChecker {
  static const MethodChannel _channel = MethodChannel("usb_debug_checker");

  /// Checks if USB debugging is enabled on the Android device.
  static Future<bool> isUsbDebuggingEnabled() async {
    try {
      final bool isEnabled =
          await _channel.invokeMethod('isUsbDebuggingEnabled');
      return isEnabled;
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> getPlatformVersion() {
    return UsbDebugCheckerPlatform.instance.getPlatformVersion();
  }
}
