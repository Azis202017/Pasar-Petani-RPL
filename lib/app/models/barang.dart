import 'package:pasar_petani/app/models/status.dart';

class Barang {
  final int id;
  final int idPetani;
  final int idBarang;
  final String kategori;
  final int harga;
  final int berat;
  final int jumlah;
  final String durasiTahan;
  final String foto;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String name;
  final String description;
  final Map<String, dynamic> petani;
  final Map<String, dynamic> koperasi;
  final List<Status> status;
  final Status? currentStatus;

  Barang({
    required this.id,
    required this.idPetani,
    required this.idBarang,
    required this.kategori,
    required this.harga,
    required this.berat,
    required this.jumlah,
    required this.durasiTahan,
    required this.foto,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.description,
    required this.petani,
    required this.koperasi,
    required this.status,
    this.currentStatus,
  });

  factory Barang.fromJson(Map<String, dynamic> json) {
    return Barang(
      id: json['id'],
      idPetani: json['id_petani'],
      idBarang: json['id_barang'],
      kategori: json['kategori'],
      harga: json['harga'],
      berat: json['berat'],
      jumlah: json['jumlah'],
      durasiTahan: json['durasi_tahan'],
      foto: json['foto'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      name: json['name'],
      description: json['description'],
      petani: json['petani'],
      koperasi: json['koperasi'],
      status:
          json['status'].map<Status>((json) => Status.fromJson(json)).toList(),
      currentStatus: json['current_status'] == null
          ? null
          : Status.fromJson(json['current_status']),
    );
  }
}
