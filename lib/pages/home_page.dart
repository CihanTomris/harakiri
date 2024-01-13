import 'package:fb_get_1301/service/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<AuthController>(builder: (_) {
          return Text(
            _firebaseAuth.currentUser!.displayName!,
            style: const TextStyle(color: Colors.black, fontSize: 20),
          );
        }),
      ),
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
