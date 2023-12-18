import 'package:flutter/foundation.dart';
import 'package:pasar_petani/app/models/status.dart';

class Barang {
  final int id;
  final int idPetani;
  final int idKoperasi;
  final String? kategori;
  final int harga;
  final int berat;
  final int jumlah;
  final String? durasiTahan;
  final String foto;
  final String fotoUrl;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String? description;
  final Map<String, dynamic> petani;
  final Map<String, dynamic> koperasi;
  final List<Status> status;

  Barang({
    required this.id,
    required this.idPetani,
    required this.idKoperasi,
    required this.kategori,
    required this.harga,
    required this.berat,
    required this.jumlah,
    this.durasiTahan,
    required this.foto,
    required this.fotoUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.petani,
    required this.koperasi,
    required this.status,
    this.description,
  });

  factory Barang.fromJson(Map<String, dynamic> json) {
    if (kDebugMode) {
      if (json['status'].isNotEmpty) {
        print(json['status']);
      }
    }
    return Barang(
      id: json['id'],
      idPetani: int.parse(json['id_petani']),
      idKoperasi: int.parse(json['id_koperasi']),
      kategori: json['kategori'],
      harga: int.parse(json['harga']),
      berat: int.parse(json['berat']),
      jumlah: int.parse(json['jumlah']),
      durasiTahan: json['durasi_tahan'] ?? '',
      foto: json['foto'],
      fotoUrl: json['foto_url'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      name: json['name'],
      description: json['description'] ?? '',
      petani: json['petani'],
      koperasi: json['koperasi'],
      status: json['status'].isEmpty || json['status'] == null
          ? []
          : List<Status>.from(json['status']!.map((x) => Status.fromJson(x))),
    );
  }
}
