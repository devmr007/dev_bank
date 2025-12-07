import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // Observable variables
  var isLoading = false.obs; // show loading spinner
  var isLoggedIn = false.obs; // user login state
  var userEmail = ''.obs; // current user email

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // Simulated sign-in function
  Future<void> signIn({required String email, required String password}) async {
    try {
      isLoading.value = true;

      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));

      // Simple mock check
      if (email == 'dev@bank.com' && password == '123456') {
        isLoggedIn.value = true;
        userEmail.value = email;
      } else {
        isLoggedIn.value = false;
        userEmail.value = '';
        Get.snackbar('Error', 'Invalid email or password');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Sign out
  void signOut() {
    isLoggedIn.value = false;
    userEmail.value = '';
  }

  // Optional: check login status on app start
  void checkLogin() {
    // For example, read from shared preferences / secure storage
    // isLoggedIn.value = ...
    // userEmail.value = ...
  }
}
