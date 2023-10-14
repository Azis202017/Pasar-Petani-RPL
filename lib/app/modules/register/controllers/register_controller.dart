import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasar_petani/app/services/authentication.dart';

class RegisterController extends GetxController {
  final registerFormKey =
      GlobalKey<FormState>(debugLabel: 'GlobalFormKey #register');
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();

  final registerLoading = false.obs;

  final List<bool> hidePassword = [true, true].obs;

  Future<void> register() async {
    if (registerFormKey.currentState!.validate()) {
      registerLoading.value = true;
      try {
        var response = await Authentication().register(
          fullName.text,
          email.text,
          address.text,
          password.text,
          phoneNumber.text,
        );
        if (kDebugMode) {
          print(response);
        }
      } finally {
        Get.snackbar('Sukses', 'Registrasi berhasil');
        Get.toNamed('/login');
        registerLoading.value = false;
      }
    }
  }
}
