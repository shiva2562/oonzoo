import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/routes.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() async {
    super.onInit();
    bool isLoggedIn = await checkLoginStatus();
    if (isLoggedIn) {
      Get.toNamed(Routes.dashboardScreen);
    }
  }

  Future<void> login() async {
    try {
      final String email = emailController.text.trim();
      final String password = passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        Get.defaultDialog(
          title: 'Error',
          content: const Text('Please enter email and password.'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Get.back(),
            ),
          ],
        );
        return;
      }

      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      setLoginStatus(true);
      Get.toNamed(Routes.dashboardScreen);
    } catch (e) {
      Get.defaultDialog(
        title: 'Error',
        content: Text(e.toString()),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Get.back(),
          ),
        ],
      );
    }
  }

  Future<void> signup() async {
    try {
      final String email = emailController.text.trim();
      final String password = passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        Get.defaultDialog(
          title: 'Error',
          content: const Text('Please enter email and password.'),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () => Get.back(),
            ),
          ],
        );
        return;
      }

      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      setLoginStatus(true);
      Get.showSnackbar(const GetSnackBar(
        title: 'Success!',
        message: 'Your Account has been created',
        isDismissible: true,
        duration: Duration(seconds: 3),
      ));

      Get.toNamed(Routes.dashboardScreen);
    } catch (e) {
      Get.defaultDialog(
        title: 'Error',
        content: Text(e.toString()),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Get.back(),
          ),
        ],
      );
    }
  }

  Future<bool> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    return isLoggedIn;
  }

  void setLoginStatus(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('isLoggedIn', isLoggedIn);
  }
}
