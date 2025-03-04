class CompanionModel {
  final String pendampingNik;
  final String pendampingName;

  CompanionModel({
    required this.pendampingNik,
    required this.pendampingName,
  });

  factory CompanionModel.fromJson(Map<String, dynamic> json) => CompanionModel(
        pendampingNik: json["pendamping_nik"],
        pendampingName: json["pendamping_name"],
      );

  Map<String, dynamic> toJson() => {
        "pendamping_nik": pendampingNik,
        "pendamping_name": pendampingName,
      };
}
