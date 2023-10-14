import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pasar_petani/app/global_widgets/input_field.dart';
import 'package:pasar_petani/app/global_widgets/large_button.dart';
import 'package:pasar_petani/config/constants.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/sayur.png"),
                fit: BoxFit.fitWidth,
                filterQuality: FilterQuality.medium,
                alignment: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                reverse: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16 * ffem),
                      child: Form(
                        key: controller.loginFormKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: 76 * ffem, bottom: 48 * ffem),
                              child: Center(child: logo),
                            ),
                            InputTextField(
                                labelText: 'Email',
                                inputType: InputType.email,
                                controller: controller.email),
                            InputTextField(
                              labelText: 'Password',
                              inputType: InputType.password,
                              controller: controller.password,
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 48 * ffem),
                                child: LargeButton(
                                    text: 'Login',
                                    onPressed: controller.login)),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 68 * ffem),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Belum memiliki akun?",
                              textAlign: TextAlign.end,
                              style: Theme.of(context).textTheme.labelMedium),
                          TextButton(
                            onPressed: () {
                              Get.toNamed('/register');
                            },
                            child: Text(
                              "Daftar",
                              textAlign: TextAlign.start,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
