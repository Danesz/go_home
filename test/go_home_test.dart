import 'package:flutter_test/flutter_test.dart';
import 'package:go_home/go_home_platform_interface.dart';
import 'package:go_home/go_home_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockGoHomePlatform
    with MockPlatformInterfaceMixin
    implements GoHomePlatform {

  @override
  Future<bool> sendAppToHome() => Future.value(true);
}

void main() {
  final GoHomePlatform initialPlatform = GoHomePlatform.instance;

  test('$MethodChannelGoHome is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelGoHome>());
  });

}
