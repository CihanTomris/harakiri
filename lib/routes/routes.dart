import 'package:fb_get_1301/pages/home_page.dart';
import 'package:fb_get_1301/pages/login_page.dart';
import 'package:fb_get_1301/pages/register_page.dart';
import 'package:fb_get_1301/pages/user_fill_page.dart';
import 'package:get/get.dart';

class Routes {
  static const LOGIN_PAGE = '/';
  static const REGISTER_PAGE = '/register-page';
  static const HOME_PAGE = '/home-page';
  static const DETAIL_PAGE = '/detail-page';

  static List<GetPage> pages = [
    GetPage(name: Routes.LOGIN_PAGE, page: () => LoginPage()),
    GetPage(name: Routes.REGISTER_PAGE, page: () => RegisterPage()),
    GetPage(name: Routes.HOME_PAGE, page: () => HomePage()),
    GetPage(name: Routes.DETAIL_PAGE, page: () => UserFillPage()),
  ];
}
