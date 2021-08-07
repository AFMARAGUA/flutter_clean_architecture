import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:practice_flutter_maragua/home/domain/services/user_service.dart';

class CreateController extends GetxController {
  CreateController({required this.userService});
  RxMap _body = {
    "email": "",
    "first_name": "",
    "last_name": "",
    "avatar": "",
  }.obs;
  final UserService userService;

  Map get body => _body;

  setFirstName(String value) {
    _body["first_name"] = value;
  }

  setLastName(String value) {
    _body["last_name"] = value;
  }

  setEmail(String value) {
    _body["email"] = value;
  }

  void createUser() {
    EasyLoading.show(status: 'loading...');
    userService.createUser(body).then((value) {
      if (value)
        EasyLoading.showSuccess('Great Success!');
      else
        EasyLoading.showError('Failed');
    });
  }
}
