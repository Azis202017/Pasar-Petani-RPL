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
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/brokoli.png'),
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
                  'Brokoli',
                  textAlign: TextAlign.start,
                  style: defaultTheme.textTheme.titleMedium,
                ),
                const SizedBox(height: 9),
                const Text(
                  'Harga Tawar: Rp 14.000',
                  style: TextStyle(
                    color: Color(0xff073e10),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Produk fresh dan menyenangkan.',
                  style: TextStyle(
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
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jenis',
                            style: TextStyle(
                                color: CustomColors.primaryTextColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Kubis',
                            style: TextStyle(fontSize: 13),
                          ),
                          Text(
                            'Durasi Tahan',
                            style: TextStyle(
                                color: CustomColors.primaryTextColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '5 Hari',
                            style: TextStyle(fontSize: 13),
                          ),
                          Text(
                            'Jumlah',
                            style: TextStyle(
                                color: CustomColors.primaryTextColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '20 Ikat',
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 167 * ffem,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Kategori',
                            style: TextStyle(
                                color: CustomColors.primaryTextColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Sayuran',
                            style: TextStyle(fontSize: 13),
                          ),
                          Text(
                            'Berat',
                            style: TextStyle(
                                color: CustomColors.primaryTextColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '500 gram',
                            style: TextStyle(fontSize: 13),
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
      ),
    );
  }
}
