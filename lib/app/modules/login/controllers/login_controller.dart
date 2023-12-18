import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasar_petani/app/services/authentication.dart';
import 'package:pasar_petani/config/constants.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>(debugLabel: 'GlobalFormKey #login');
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  final RxBool hidePassword = true.obs;

  Future<void> login() async {
    if (loginFormKey.currentState!.validate()) {
      try {
        var response = await Authentication().login(
          email.text,
          password.text,
        );
        if (kDebugMode) {
          print(response.accessToken);
        }
        Get.snackbar('Sukses', 'Login berhasil');
        storage.write('access_token', response.accessToken);
        Get.toNamed('/home');
      } catch (e) {
        Get.snackbar('Gagal', e.toString());
      }
    }
  }
}
