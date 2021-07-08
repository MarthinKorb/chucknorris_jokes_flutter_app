import 'dart:convert';

class Joke {
  final String? id;
  final String? iconRrl;
  final String? url;
  final String? value;
  Joke({
    this.id,
    this.iconRrl,
    this.url,
    this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'iconRrl': iconRrl,
      'url': url,
      'value': value,
    };
  }

  factory Joke.fromMap(Map<String, dynamic> map) {
    return Joke(
      id: map['id'],
      iconRrl: map['iconRrl'],
      url: map['url'],
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Joke.fromJson(String source) => Joke.fromMap(json.decode(source));
}
