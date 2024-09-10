import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'go_home_platform_interface.dart';

/// An implementation of [GoHomePlatform] that uses method channels.
class MethodChannelGoHome extends GoHomePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('go_home');

  @override
  Future<bool> sendAppToHome() async {
    final ok = await methodChannel.invokeMethod<bool?>('sendAppToHome');
    return ok ?? Future.value(false);
  }
}
