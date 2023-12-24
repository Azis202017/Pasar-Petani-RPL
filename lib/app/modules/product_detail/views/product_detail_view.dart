import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasar_petani/config/theme/colors.dart';
import 'package:pasar_petani/config/theme/default_theme.dart';

import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Permintaan'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(controller.detailProduct.fotoUrl),
                  fit: BoxFit.fitHeight,
                ),
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.detailProduct.name,
                    textAlign: TextAlign.start,
                    style: defaultTheme.textTheme.titleMedium,
                  ),
                  const SizedBox(height: 9),
                  Text(
                    'Harga Tawar: ${controller.detailProduct.harga}',
                    style: const TextStyle(
                      color: Color(0xff073e10),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    controller.detailProduct.description ?? '',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  ),
                  const Divider(
                    color: Color(0xffe1e1e1),
                    thickness: 1,
                    height: 32,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 168 * ffem,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Durasi Tahan',
                              style: TextStyle(
                                  color: CustomColors.primaryTextColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              controller.detailProduct.durasiTahan ??
                                  'Tidak ada',
                              style: const TextStyle(fontSize: 13),
                            ),
                            const Text(
                              'Jumlah',
                              style: TextStyle(
                                  color: CustomColors.primaryTextColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              controller.detailProduct.jumlah.toString(),
                              style: const TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 167 * ffem,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Kategori',
                              style: TextStyle(
                                  color: CustomColors.primaryTextColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              controller.detailProduct.kategori ?? '',
                              style: const TextStyle(fontSize: 13),
                            ),
                            const Text(
                              'Berat',
                              style: TextStyle(
                                  color: CustomColors.primaryTextColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              controller.detailProduct.berat.toString(),
                              style: const TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        minimumSize: Size(
                            MediaQuery.of(context).size.width * 0.4, 44 * ffem),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        side: const BorderSide(color: Colors.red, width: 1),
                      ),
                      child: const Text('Tolak'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(Size(
                              MediaQuery.of(context).size.width * 0.4,
                              44 * ffem)),
                          elevation: MaterialStateProperty.all<double>(0),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xff62C172)),
                          foregroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xffFFFFFF)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ))),
                      child: const Text('Diterima'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
