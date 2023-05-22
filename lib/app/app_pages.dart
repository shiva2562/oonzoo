import 'package:get/get.dart';
import 'package:oonzoo/screens/dashboard/dashboard_screen.dart';
import 'package:oonzoo/screens/product/product_screen.dart';

import '../screens/auth/login_screen.dart';

class AppPages {
  final List<GetPage> pages = [
    LoginSignupPage.page,
    DashboardPage.page,
    ProductPage.page
  ];
}
