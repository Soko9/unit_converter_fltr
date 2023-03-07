// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Unit {
  final String label;
  final List<Map<String, dynamic>> units;

  Unit({
    required this.label,
    required this.units,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'label': label,
      'units': units,
    };
  }

  factory Unit.fromMap(Map<String, dynamic> map) {
    return Unit(
      label: map['label'] as String,
      units: List<Map<String, dynamic>>.from(
        (map['units'] as List<Map<String, dynamic>>)
            .map<Map<String, dynamic>>(
              (x) => x,
            )
            .toList(),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Unit.fromJson(String source) =>
      Unit.fromMap(json.decode(source) as Map<String, dynamic>);

  static List<Map<String, dynamic>> toListOfMap(List<dynamic> list) => list
      .map(
        (l) => {
          "name": l["name"],
          "conversion": l["conversion"],
        },
      )
      .toList();

  @override
  String toString() => 'Unit(label: $label, units: $units)';
}
