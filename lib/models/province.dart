class Province {
  final int id;
  final String name;
  final int countryId;

  Province({
    required this.id,
    required this.name,
    required this.countryId,
  });

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        id: json['id'],
        name: json['name'],
        countryId: json['country_id'],
      );
}
