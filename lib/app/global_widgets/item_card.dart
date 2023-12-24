import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pasar_petani/app/models/barang.dart';

class ItemCard extends StatelessWidget {
  final Barang barang;

  const ItemCard({
    super.key,
    required this.barang,
  });

  @override
  Widget build(BuildContext context) {
    final String dateString = DateFormat('dd MMMM yyyy').format(
        barang.status.isNotEmpty
            ? barang.status.last.updatedAt
            : barang.createdAt);
    return GestureDetector(
      onTap: () => {
        Get.toNamed('/product-detail', arguments: {'barang': barang})
      },
      child: Container(
        height: 96,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 68,
                height: 68,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(barang.fotoUrl),
                      filterQuality: FilterQuality.low,
                      alignment: Alignment.center,
                      fit: BoxFit.contain),
                  color: const Color(0xffD1F3D1),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      barang.name,
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 12),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Text(
                        barang.petani['nama'],
                        style: GoogleFonts.poppins(
                            color: const Color(0xffAAAAAA),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  TextButton(
                    onPressed: () => {},
                    style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all<Size>(const Size(82, 20)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xff62C172)),
                        textStyle: MaterialStateProperty.all<TextStyle>(
                            GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w400)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ))),
                    child: Text('Detail',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w400)),
                  ),
                  const Spacer(),
                  Text(dateString,
                      style: GoogleFonts.poppins(
                          color: const Color(0xffAAAAAA),
                          fontSize: 12,
                          fontWeight: FontWeight.w400)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
