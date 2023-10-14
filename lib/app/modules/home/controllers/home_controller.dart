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
  late List<Barang> _listBarang;

  @override
  void onInit() {
    super.onInit();
    if (kDebugMode) {
      print('initializing');
    }
    itemInit = refreshListBarang();
  }

  Future refreshListBarang() async {
    final listBarang = await Permintaan().getAll();
    _listBarang = listBarang;
    if (kDebugMode) {
      print('refreshed');
    }
    update();
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
        Tab(
          child: Text(
            "Baru",
            textAlign: TextAlign.center,
          ),
        ),
        Tab(
          child: Text(
            "Proses",
            textAlign: TextAlign.center,
          ),
        ),
        Tab(
          child: Text(
            "Selesai",
            textAlign: TextAlign.center,
          ),
        ),
      ]);

  Widget listItem() {
    return FutureBuilder(
        future: itemInit,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              !snapshot.hasData) {
            return const TabBarView(children: [
              Center(child: CircularProgressIndicator()),
              Center(child: CircularProgressIndicator()),
              Center(child: CircularProgressIndicator()),
            ]);
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasError) {
            return TabBarView(children: [
              Center(
                  child: Column(
                children: [
                  const Text('Error'),
                  Text(snapshot.error.toString()),
                ],
              )),
              Center(
                  child: Column(
                children: [
                  const Text('Error'),
                  Text(snapshot.error.toString()),
                ],
              )),
              Center(
                  child: Column(
                children: [
                  const Text('Error'),
                  Text(snapshot.error.toString()),
                ],
              )),
            ]);
          }

          Map<String, List<Barang>> statusBarang = {
            'baru': [],
            'proses': [],
            'selesai': [],
          };

          for (var item in _listBarang) {
            if (item.currentStatus == null) {
              continue;
            }
            switch (item.currentStatus!.status) {
              case "Baru":
                {
                  statusBarang['baru']!.add(item);
                }
                continue;
              case "Proses":
                {
                  statusBarang['proses']!.add(item);
                }
                continue;
              case "Selesai":
                {
                  statusBarang['selesai']!.add(item);
                }
                continue;
            }
          }

          return TabBarView(children: [
            statusBarang['baru']!.isEmpty
                ? RefreshIndicator(
                    onRefresh: () async => {refreshListBarang()},
                    child: const SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: EmptyState()),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: statusBarang['baru']!.length,
                        itemBuilder: (context, index) {
                          return ItemCard(
                              productName: statusBarang['baru']![index].name,
                              farmerName:
                                  statusBarang['baru']![index].petani['name'],
                              picture: NetworkImage(
                                  statusBarang['baru']![index].foto),
                              date: statusBarang['baru']![index].createdAt);
                        }),
                  ),
            statusBarang['proses']!.isEmpty
                ? const EmptyState()
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: statusBarang['proses']!.length,
                        itemBuilder: (context, index) {
                          return ItemCard(
                              productName: statusBarang['proses']![index].name,
                              farmerName:
                                  statusBarang['proses']![index].petani['name'],
                              picture: NetworkImage(
                                  statusBarang['proses']![index].foto),
                              date: statusBarang['proses']![index].createdAt);
                        }),
                  ),
            statusBarang['selesai']!.isEmpty
                ? const EmptyState()
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: statusBarang['selesai']!.length,
                        itemBuilder: (context, index) {
                          return ItemCard(
                              productName: statusBarang['selesai']![index].name,
                              farmerName: statusBarang['selesai']![index]
                                  .petani['name'],
                              picture: NetworkImage(
                                  statusBarang['selesai']![index].foto),
                              date: statusBarang['selesai']![index].createdAt);
                        }),
                  ),
          ]);
        });
  }
}
