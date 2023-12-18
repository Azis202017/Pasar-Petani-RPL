class Status {
  final int id;
  final int idPermintaan;
  final String keterangan;
  final String tanggalPerubahan;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Status({
    required this.id,
    required this.idPermintaan,
    required this.keterangan,
    required this.tanggalPerubahan,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      id: json['id'],
      idPermintaan: int.parse(json['id_permintaan']),
      keterangan: json['keterangan'] ?? '',
      tanggalPerubahan: json['tanggal_perubahan'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
