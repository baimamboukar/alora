// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Farmer {
  final String name;
  final String email;
  final String photoURL;
  final bool isPrenium;
  Farmer({
    required this.name,
    required this.email,
    required this.photoURL,
    required this.isPrenium,
  });

  Farmer copyWith({
    String? name,
    String? email,
    String? photoURL,
    bool? isPrenium,
  }) {
    return Farmer(
      name: name ?? this.name,
      email: email ?? this.email,
      photoURL: photoURL ?? this.photoURL,
      isPrenium: isPrenium ?? this.isPrenium,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'photoURL': photoURL,
      'isPrenium': isPrenium,
    };
  }

  factory Farmer.fromMap(Map<String, dynamic> map) {
    return Farmer(
      name: (map['name'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      photoURL: (map['photoURL'] ?? '') as String,
      isPrenium: (map['isPrenium'] ?? false) as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Farmer.fromJson(String source) =>
      Farmer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Farmer(name: $name, email: $email, photoURL: $photoURL, isPrenium: $isPrenium)';
  }
}
