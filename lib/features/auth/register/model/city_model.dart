class CityModel {
  final String kdKabko;
  final String kabko;

  CityModel({
    required this.kdKabko,
    required this.kabko,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        kdKabko: json["kd_kabko"],
        kabko: json["kabko"],
      );

  Map<String, dynamic> toJson() => {
        "kd_kabko": kdKabko,
        "kabko": kabko,
      };
}
