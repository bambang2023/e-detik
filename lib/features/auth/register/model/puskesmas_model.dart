class PuskesmasModel {
  final int id;
  final String kabko;
  final String kecamatan;
  final String kdKecamatan;
  final String puskesmas;
  final String kdPuskesmas;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  PuskesmasModel({
    required this.id,
    required this.kabko,
    required this.kecamatan,
    required this.kdKecamatan,
    required this.puskesmas,
    required this.kdPuskesmas,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory PuskesmasModel.fromJson(Map<String, dynamic> json) => PuskesmasModel(
        id: json["id"],
        kabko: json["kabko"],
        kecamatan: json["kecamatan"],
        kdKecamatan: json["kd_kecamatan"],
        puskesmas: json["puskesmas"],
        kdPuskesmas: json["kd_puskesmas"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kabko": kabko,
        "kecamatan": kecamatan,
        "kd_kecamatan": kdKecamatan,
        "puskesmas": puskesmas,
        "kd_puskesmas": kdPuskesmas,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}
