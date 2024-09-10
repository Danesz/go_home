import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'go_home_method_channel.dart';

abstract class GoHomePlatform extends PlatformInterface {
  /// Constructs a GoHomePlatform.
  GoHomePlatform() : super(token: _token);

  static final Object _token = Object();

  static GoHomePlatform _instance = MethodChannelGoHome();

  /// The default instance of [GoHomePlatform] to use.
  ///
  /// Defaults to [MethodChannelGoHome].
  static GoHomePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [GoHomePlatform] when
  /// they register themselves.
  static set instance(GoHomePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> sendAppToHome() async {
    throw UnimplementedError('sendAppToHome() has not been implemented.');
  }
}
