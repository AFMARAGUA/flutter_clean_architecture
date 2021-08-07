import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'list_users_controller.dart';

class ListUsersScreen extends GetWidget<ListUsersController> {
  final ListUsersController controller = Get.put(
      ListUsersController(userRepository: Get.find(), userService: Get.find()));
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: controller.listUsers.length,
            itemBuilder: (BuildContext context, int index) {
              final user = controller.listUsers[index];
              return InkWell(
                onTap: () => controller.getUser(user.id),
                child: Card(
                  key: ValueKey(user.id),
                  margin: EdgeInsets.all(5.0),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                      title: Text(user.email),
                      trailing: Icon(
                        Icons.remove_red_eye,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
