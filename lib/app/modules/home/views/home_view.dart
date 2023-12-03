import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pasar_petani/config/theme/colors.dart';
import 'package:pasar_petani/config/theme/default_theme.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(132 * fem),
            child: AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                backgroundColor: defaultTheme.primaryColor,
                toolbarHeight: 88,
                title: Text('Permintaan',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        height: 1.2 * ffem / fem,
                        fontWeight: FontWeight.w700)),
                bottom: PreferredSize(
                    preferredSize: const Size(375, 48),
                    child: Material(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Stack(
                            fit: StackFit.passthrough,
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              Container(
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color(0xffE1E1E1),
                                            width: 1))),
                              ),
                              controller.tabBar
                            ]),
                      ),
                    ))),
          ),
          body: Container(
              color: CustomColors.accentColor,
              child: controller.listItem(context)),
        ));
  }
}
