import 'dart:convert';

/// Convert JSON string to Province object.
Province provinceFromJson(String str) => Province.fromJson(json.decode(str));

/// Convert Province object to JSON string.
String provinceToJson(Province data) => json.encode(data.toJson());

class Province {
  Province({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  factory Province.fromJson(Map<String, dynamic> json) => Province(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  String toString() => name;
}
