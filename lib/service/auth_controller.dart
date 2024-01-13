import 'package:fb_get_1301/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  ///email ve sifreyle oturum ac
  Future<void> signInEmailandPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user!.email!.isNotEmpty) {
        Get.toNamed(Routes.HOME_PAGE);
        print(userCredential);
      } else {
        print(userCredential);
      }
    } on FirebaseAuthException catch (e) {
      Get.rawSnackbar(message: e.message);
      throw Exception(e.message);
    }
  }

  /// yeni kullanici olusturma
  Future<void> createNewUser(
      String email, String password, String confirmPassword) async {
    if (password != confirmPassword) {
      Get.rawSnackbar(message: "Passwords not match!");
    } else {
      try {
        _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        Get.toNamed(Routes.DETAIL_PAGE);
      } catch (e) {
        throw Exception(e);
      }
    }
  }

  Future<void> updateUserInfo(String name) async {
    if (name.isNotEmpty) {
      await _firebaseAuth.currentUser!.updateDisplayName(name);
      print(_firebaseAuth.currentUser);
      Get.toNamed(Routes.HOME_PAGE);
    }
  }
}
