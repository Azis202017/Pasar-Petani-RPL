import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pasar_petani/app/global_widgets/empty_state.dart';
import 'package:pasar_petani/app/global_widgets/item_card.dart';
import 'package:pasar_petani/app/models/barang.dart';
import 'package:pasar_petani/app/services/permintaan.dart';

class HomeController extends GetxController {
  static const primaryColor = Color(0xff62C172);
  static const bottomNavbarColor = Color(0xffAAAAAA);
  static const accentColor = Color(0xffF4FBF4);
  static const primaryShade1 = Color(0xffD1F3D1);

  late Future<void> itemInit;
  List<Barang> _listBarang = [];

  @override
  void onInit() {
    super.onInit();
    if (kDebugMode) {
      print('initializing');
    }
    itemInit = refreshListBarang();
  }

  Future<void> refreshListBarang() async {
    try {
      final listBarang = await Permintaan().getAll();
      _listBarang = listBarang;
      if (kDebugMode) {
        print('refreshed');
      }
      update();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      Get.snackbar('Gagal', e.toString());
      Get.toNamed('/login');
    }
  }

  final TabBar tabBar = TabBar(
    indicatorColor: primaryColor,
    unselectedLabelColor: bottomNavbarColor,
    labelColor: primaryColor,
    labelStyle: GoogleFonts.poppins(
        color: primaryColor, fontWeight: FontWeight.w400, fontSize: 14),
    indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(width: 1.0, color: primaryColor)),
    tabs: const [
      Tab(child: Text("Baru", textAlign: TextAlign.center)),
      Tab(child: Text("Proses", textAlign: TextAlign.center)),
      Tab(child: Text("Selesai", textAlign: TextAlign.center)),
    ],
  );

  // Getting list of items with context as parameter to get the size of the screen
  Widget listItem(context) {
    return FutureBuilder(
        future: itemInit,
        builder: (context, snapshot) {
          // If connection state is waiting, show loading indicator
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const TabBarView(children: [
              Center(child: CircularProgressIndicator()),
              Center(child: CircularProgressIndicator()),
              Center(child: CircularProgressIndicator()),
            ]);
          }

          // If connection state is done and snapshot has error, show error message
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasError) {
            final errorMessage = snapshot.error?.toString() ?? 'Unknown error';
            return TabBarView(children: [
              Center(child: Text(errorMessage)),
              Center(child: Text(errorMessage)),
              Center(child: Text(errorMessage)),
            ]);
          }

          Map<String, List<Barang>> statusBarang = {
            'baru': [],
            'proses': [],
            'selesai': [],
          };

          for (var item in _listBarang) {
            if (item.status.isEmpty) {
              statusBarang['baru']?.add(item);
              continue;
            }
            statusBarang[item.status.last.status.toLowerCase()]?.add(item);
          }

          return TabBarView(children: [
            _buildListTab(statusBarang['baru']!, context),
            _buildListTab(statusBarang['proses']!, context),
            _buildListTab(statusBarang['selesai']!, context),
          ]);
        });
  }

  Widget _buildListTab(List<Barang> items, context) {
    return RefreshIndicator(
      onRefresh: refreshListBarang,
      child: items.isEmpty
          ? SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: const EmptyState()),
            )
          : ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ItemCard(
                  productName: item.name,
                  farmerName: item.petani['name'],
                  picture: NetworkImage(item.foto),
                  date: item.createdAt,
                );
              },
            ),
    );
  }
}
