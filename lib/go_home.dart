
import 'go_home_platform_interface.dart';

class GoHome {
  static void sendAppToHome() async {
    GoHomePlatform.instance.sendAppToHome();
  }
}
