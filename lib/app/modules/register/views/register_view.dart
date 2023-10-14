import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasar_petani/app/global_widgets/input_field.dart';
import 'package:pasar_petani/app/global_widgets/large_button.dart';
import 'package:pasar_petani/config/constants.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SizedBox(
            // set height to screen height
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Form(
                      key: controller.registerFormKey,
                      child: Column(
                        children: [
                          InputTextField(
                              labelText: 'Nama Lengkap',
                              inputType: InputType.name,
                              controller: controller.fullName),
                          InputTextField(
                              labelText: 'Email',
                              inputType: InputType.email,
                              controller: controller.email),
                          InputTextField(
                              labelText: 'Alamat',
                              inputType: InputType.address,
                              controller: controller.address),
                          InputTextField(
                              labelText: 'Nomor hp',
                              inputType: InputType.phoneNumber,
                              controller: controller.phoneNumber),
                          InputTextField(
                              labelText: 'Password',
                              inputType: InputType.password,
                              controller: controller.password),
                          InputTextField(
                              labelText: 'Konfirmasi Password',
                              inputType: InputType.confirmPassword,
                              confirmPasswordController: controller.password,
                              controller: controller.confirmPassword),
                          Padding(
                              padding: EdgeInsets.only(top: 48 * ffem),
                              child: LargeButton(
                                text: 'Daftar',
                                onPressed: controller.register,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 68 * ffem),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Sudah memiliki akun?",
                            textAlign: TextAlign.end,
                            style: Theme.of(context).textTheme.labelMedium),
                        TextButton(
                          onPressed: () {
                            Get.toNamed('/login');
                          },
                          child: Text(
                            "Login",
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                  registrationSvg,
                ],
              ),
            ),
          ),
        ));
  }
}
