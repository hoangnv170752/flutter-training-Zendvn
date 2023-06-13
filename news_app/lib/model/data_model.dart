class DataModel {
  final String name;
  final String link;

  DataModel({required this.name, required this.link});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json['name'] ?? "",
      link: json['link'] ?? "",
    );
  }
}
