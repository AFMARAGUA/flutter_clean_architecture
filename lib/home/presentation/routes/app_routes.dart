import 'package:get/get.dart';
import 'package:practice_flutter_maragua/home/presentation/pages/dashboard/dashboard_binding.dart';
import 'package:practice_flutter_maragua/home/presentation/pages/dashboard/dashboard_screen.dart';
import 'package:practice_flutter_maragua/home/presentation/pages/list_users/list_users_screen.dart';

class AppRoutes {
  static final String home = '/home';
  static final String dashboard = '/dashboard';
}

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => ListUsersScreen(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardScreen(),
      binding: DashboardBinding(),
    ),
  ];
}
