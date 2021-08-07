import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_flutter_maragua/home/presentation/widgets/main_textFormField.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'create_controller.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class CreateScreen extends GetWidget<CreateController> {
  final CreateController controller =
      Get.put(CreateController(userService: Get.find()));

  void validateForm(c) {
    if (_formKey.currentState!.validate()) c.createUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => validateForm(controller),
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    height: 200.0,
                    child: SvgPicture.asset(
                      'assets/images/undraw_Forms.svg',
                    ),
                  ),
                  _mainTextFormField(
                    'First name *',
                    (text) => controller.setFirstName(text),
                  ),
                  _mainTextFormField(
                    'Last name *',
                    (text) => controller.setLastName(text),
                  ),
                  _mainTextFormField(
                    'Email *',
                    (text) => controller.setEmail(text),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _mainTextFormField(
      String? hintText, dynamic Function(String)? onChanged(text)) {
    return MainTextFormField.textFormField(
      decoration: InputDecoration(hintText: hintText),
      onChanged: (text) => onChanged(text),
      validator: (value) {
        if (value.isEmpty)
          return 'Required';
        else
          return '';
      },
    );
  }
}
