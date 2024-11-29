import 'package:flutter_test/flutter_test.dart';
import 'package:usb_debug_checker/usb_debug_checker.dart';
import 'package:usb_debug_checker/usb_debug_checker_platform_interface.dart';
import 'package:usb_debug_checker/usb_debug_checker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockUsbDebugCheckerPlatform
    with MockPlatformInterfaceMixin
    implements UsbDebugCheckerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final UsbDebugCheckerPlatform initialPlatform = UsbDebugCheckerPlatform.instance;

  test('$MethodChannelUsbDebugChecker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelUsbDebugChecker>());
  });

  test('getPlatformVersion', () async {
    UsbDebugChecker usbDebugCheckerPlugin = UsbDebugChecker();
    MockUsbDebugCheckerPlatform fakePlatform = MockUsbDebugCheckerPlatform();
    UsbDebugCheckerPlatform.instance = fakePlatform;

    expect(await usbDebugCheckerPlugin.getPlatformVersion(), '42');
  });
}
