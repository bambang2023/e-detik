class DesaModel {
  final String kdDesa;
  final String desa;

  DesaModel({
    required this.kdDesa,
    required this.desa,
  });

  factory DesaModel.fromJson(Map<String, dynamic> json) => DesaModel(
        kdDesa: json["kd_desa"],
        desa: json["desa"],
      );

  Map<String, dynamic> toJson() => {
        "kd_desa": kdDesa,
        "desa": desa,
      };
}
