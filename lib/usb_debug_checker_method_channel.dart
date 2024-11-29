import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'usb_debug_checker_platform_interface.dart';

/// An implementation of [UsbDebugCheckerPlatform] that uses method channels.
class MethodChannelUsbDebugChecker extends UsbDebugCheckerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('usb_debug_checker');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
