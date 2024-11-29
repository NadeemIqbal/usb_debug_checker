import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'usb_debug_checker_method_channel.dart';

abstract class UsbDebugCheckerPlatform extends PlatformInterface {
  /// Constructs a UsbDebugCheckerPlatform.
  UsbDebugCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static UsbDebugCheckerPlatform _instance = MethodChannelUsbDebugChecker();

  /// The default instance of [UsbDebugCheckerPlatform] to use.
  ///
  /// Defaults to [MethodChannelUsbDebugChecker].
  static UsbDebugCheckerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [UsbDebugCheckerPlatform] when
  /// they register themselves.
  static set instance(UsbDebugCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
