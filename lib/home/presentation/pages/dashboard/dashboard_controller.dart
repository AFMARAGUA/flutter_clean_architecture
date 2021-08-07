import 'package:get/get.dart';

class DashboardController extends GetxController {
  Rx<int> _tabIndex = 0.obs;

  int get tabIndex => _tabIndex.value;

  void changeTabIndex(int index) {
    _tabIndex.value = index;
  }
}
