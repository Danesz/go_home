import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_home/go_home_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelGoHome platform = MethodChannelGoHome();
  const MethodChannel channel = MethodChannel('go_home');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.sendAppToHome(), '42');
  });
}
