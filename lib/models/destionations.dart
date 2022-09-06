import 'dart:convert';

List<Destination> destionationsFromJson(String str) => List<Destination>.from(
    json.decode(str).map((x) => Destination.fromJson(x)));

String destinationsToJson(List<Destination> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Destination {
  Destination({
    this.name,
    this.code,
    this.weather,
  });

  String? code;
  String? name;
  String? weather;

  factory Destination.fromJson(Map<String, dynamic> json) => Destination(
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      weather: json['weather'] ?? '');

  Map<String, dynamic> toJson() =>
      {"code": code, "name": name, "weather": weather};
}
