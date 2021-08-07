import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_flutter_maragua/home/presentation/pages/create/create_screen.dart';
import 'package:practice_flutter_maragua/home/presentation/pages/list_users/list_users_screen.dart';

import 'dashboard_controller.dart';

class DashboardScreen extends GetWidget<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
            child: IndexedStack(
          index: controller.tabIndex,
          children: [
            ListUsersScreen(),
            CreateScreen(),
          ],
        )),
        bottomNavigationBar: BottomNavigationBar(
          onTap: controller.changeTabIndex,
          currentIndex: controller.tabIndex,
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.red,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            _bottomNavigationBarItem(Icons.group, 'Users'),
            _bottomNavigationBarItem(Icons.person_add, 'Add'),
          ],
        ),
      ),
    );
  }

  _bottomNavigationBarItem(IconData? icon, String? label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
