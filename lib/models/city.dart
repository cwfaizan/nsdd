class City {
  final int id;
  final String name;
  final int provinceId;

  City({
    required this.id,
    required this.name,
    required this.provinceId,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json['id'],
        name: json['name'],
        provinceId: json['province_id'],
      );
}
