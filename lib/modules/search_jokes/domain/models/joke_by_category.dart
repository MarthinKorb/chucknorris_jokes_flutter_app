import 'dart:convert';

class JokeByCategory {
  final List<String>? categories;
  final String? id;
  final String? iconRrl;
  final String? url;
  final String? value;
  JokeByCategory({
    this.categories,
    this.id,
    this.iconRrl,
    this.url,
    this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'categories': categories,
      'id': id,
      'iconRrl': iconRrl,
      'url': url,
      'value': value,
    };
  }

  factory JokeByCategory.fromMap(Map<String, dynamic> map) {
    return JokeByCategory(
      categories: List<String>.from(map['categories']),
      id: map['id'],
      iconRrl: map['iconRrl'],
      url: map['url'],
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory JokeByCategory.fromJson(String source) =>
      JokeByCategory.fromMap(json.decode(source));
}
