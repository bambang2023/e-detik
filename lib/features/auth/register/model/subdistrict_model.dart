class SubdistrictModel {
  final String kdKecamatan;
  final String kecamatan;

  SubdistrictModel({
    required this.kdKecamatan,
    required this.kecamatan,
  });

  factory SubdistrictModel.fromJson(Map<String, dynamic> json) =>
      SubdistrictModel(
        kdKecamatan: json["kd_kecamatan"],
        kecamatan: json["kecamatan"],
      );

  Map<String, dynamic> toJson() => {
        "kd_kecamatan": kdKecamatan,
        "kecamatan": kecamatan,
      };
}
