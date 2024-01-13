import 'package:fb_get_1301/routes/routes.dart';
import 'package:fb_get_1301/service/auth_controller.dart';
import 'package:fb_get_1301/widgets/my_button.dart';
import 'package:fb_get_1301/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserFillPage extends StatefulWidget {
  const UserFillPage({super.key});

  @override
  State<UserFillPage> createState() => _UserFillPageState();
}

class _UserFillPageState extends State<UserFillPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Lets complete your data",
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 40),
          MyTextField(
              controller: nameController, hintText: "Name", obscureText: false),
          const SizedBox(height: 40),
          MyButton(
              onTap: () => Get.find<AuthController>()
                  .updateUserInfo(nameController.value.text),
              text: "Save")
        ],
      ),
    );
  }
}
