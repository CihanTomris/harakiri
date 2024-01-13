import 'package:fb_get_1301/service/auth_controller.dart';
import 'package:fb_get_1301/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/routes.dart';
import '../widgets/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    AuthController _authController = Get.put(AuthController());

    void signInOne() {
      if (emailController.value.text.isEmpty ||
          passwordController.value.text.isEmpty) {
        Get.rawSnackbar(message: "There is no data");
      } else {
        _authController.signInEmailandPassword(
            emailController.value.text, passwordController.value.text);
      }
    }

    return Scaffold(
      backgroundColor: Colors.black12,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
        child: SingleChildScrollView(
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
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text(
                    "Dont you have an account?",
                    style: TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.REGISTER_PAGE);
                    },
                    child: const Text(
                      "Sign In!",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 70),
              MyButton(onTap: signInOne, text: "Login")
            ],
          ),
        ),
      ),
    );
  }
}
