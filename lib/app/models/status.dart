class Status {
  int id;
  String idPermintaan;
  String? keterangan;
  DateTime tglPerubahan;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Status({
    required this.id,
    required this.idPermintaan,
    this.keterangan,
    required this.tglPerubahan,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        id: json["id"],
        idPermintaan: json["id_permintaan"],
        keterangan: json["keterangan"],
        tglPerubahan: DateTime.parse(json["tgl_perubahan"]),
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
