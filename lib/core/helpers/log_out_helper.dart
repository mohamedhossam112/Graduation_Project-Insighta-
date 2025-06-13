import 'package:insighta/core/helpers/shared_pref_helper.dart';
import 'package:insighta/core/routing/routes.dart';
import 'package:insighta/main.dart';

class LogoutHelper {
  static Future<void> logout() async {
    await SharedPrefHelper.clearAllSecuredData();
    await SharedPrefHelper.clearAllData();
    await SharedPrefHelper.setData(SharedPrefKeys.isLoggedIn, false);

    /*  navigatorKey.currentState?.pushNamedAndRemoveUntil(
      Routes.logInScreen,
          (route) => false,
    );*/
    navigatorKey.currentState?.pushNamed(
      Routes.logInScreen,
    );
  }
}
