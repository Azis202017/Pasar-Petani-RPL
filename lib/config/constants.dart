import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';

const String BACKEND_URL = 'http://pasarpetani.test';

final storage = GetStorage();

final SvgPicture registrationSvg = SvgPicture.asset(
  'assets/svg/sayur.svg',
  height: 149,
  alignment: Alignment.bottomCenter,
  fit: BoxFit.contain,
);

final SvgPicture logo = SvgPicture.asset(
  'assets/svg/logo.svg',
  width: 127,
  height: 118,
  alignment: Alignment.center,
  fit: BoxFit.contain,
);

class FormKeys {
  static const loginFormKey = Key('__LOGIN__');
  static const registerFormKey = Key('__REGISTER__');
}
