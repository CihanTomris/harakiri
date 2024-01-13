import 'package:fb_get_1301/service/auth_controller.dart';
import 'package:fb_get_1301/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/my_text_field.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    super.key,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();

    //sign Up user

    void signUp() {
      if (emailController.value.text.isNotEmpty ||
          passwordController.value.text.isNotEmpty ||
          confirmPasswordController.value.text.isNotEmpty) {
        Get.find<AuthController>().createNewUser(
            emailController.value.text,
            passwordController.value.text,
            confirmPasswordController.value.text);
      }
    }

    return Scaffold(
      backgroundColor: Colors.black12,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Icon(
                Icons.ac_unit,
                color: Colors.white70,
                size: 90,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "HARAKIRI",
              style: TextStyle(fontSize: 24, color: Colors.white70),
            ),
            const SizedBox(height: 15),
            const Text(
              "Welcome to new era of lahmacun",
              style: TextStyle(color: Colors.white12),
            ),
            const SizedBox(height: 50),
            MyTextField(
                controller: emailController,
                hintText: "E-mail",
                obscureText: false),
            const SizedBox(height: 12),
            MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true),
            const SizedBox(height: 12),
            MyTextField(
                controller: confirmPasswordController,
                hintText: "Confirm password",
                obscureText: true),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => Get.to(
                    const LoginPage(),
                  ),
                  child: const Text("Login now!"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            MyButton(onTap: signUp, text: "Sign Up")
          ],
        ),
      ),
    );
  }
}
