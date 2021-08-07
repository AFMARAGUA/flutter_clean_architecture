import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_flutter_maragua/home/domain/entities/user_entity.dart';
import 'package:practice_flutter_maragua/home/domain/repositories/user_repository.dart';
import 'package:practice_flutter_maragua/home/domain/services/user_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ListUsersController extends GetxController {
  ListUsersController(
      {required this.userRepository, required this.userService});

  final UserRepository userRepository;
  final UserService userService;
  List<User> _listUsers = <User>[].obs;

  List<User> get listUsers => _listUsers;

  @override
  void onReady() {
    _getUsers();
    super.onReady();
  }

  void _getUsers() {
    userService.getUsers().then((value) {
      this._listUsers.assignAll(value);
    });
  }

  void getUser(int id) {
    EasyLoading.show(status: 'loading...');
    userRepository.getUser(id).then((user) {
      if (user.id == 0) {
        userService.getUser(id).then((user) {
          userRepository.saveUser(user).then((user) => _showUserData(user));
        });
      } else {
        _showUserData(user);
      }
    });
  }

  void _showUserData(User user) {
    EasyLoading.dismiss();
    Get.defaultDialog(
      title: '${user.firstName} ${user.lastName}',
      content: SingleChildScrollView(
        child: Container(
          child: SizedBox(
            height: 100.0,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                    user.avatar,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Flexible(
                  child: Text(
                    user.email,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      radius: 5.0,
      actions: [
        ElevatedButton(
          onPressed: () => Get.back(),
          child: Text(
            "OK",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
