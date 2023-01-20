import 'package:achilleservice/utils/global_references.dart';

class Controller {
  static Future<void> navigateToWelcome() async {
    GlobalReferences.navigatorKey.currentState
        ?.pushNamedAndRemoveUntil('/welcome', (route) => false);
  }
}
