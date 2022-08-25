// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Crop {
  final String id;
  final String name;
  final String scienticName;
  final PhotoThumbails imageURL;
  final String description;
  final bool bookMarked;
  final Treatment treatment;
  Crop({
    required this.id,
    required this.name,
    required this.scienticName,
    required this.imageURL,
    required this.description,
    required this.bookMarked,
    required this.treatment,
  });

  Crop copyWith({
    String? id,
    String? name,
    String? scienticName,
    PhotoThumbails? imageURL,
    String? description,
    bool? bookMarked,
    Treatment? treatment,
  }) {
    return Crop(
      id: id ?? this.id,
      name: name ?? this.name,
      scienticName: scienticName ?? this.scienticName,
      imageURL: imageURL ?? this.imageURL,
      description: description ?? this.description,
      bookMarked: bookMarked ?? this.bookMarked,
      treatment: treatment ?? this.treatment,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'scienticName': scienticName});
    result.addAll({'imageURL': imageURL.toMap()});
    result.addAll({'description': description});
    result.addAll({'bookMarked': bookMarked});
    result.addAll({'treatment': treatment.toMap()});

    return result;
  }

  bool get isBookmarked {
    final Box box = Hive.box('bookmarks');
    List<String> bookmarked = box.get('crops') ?? <String>[];
    return bookmarked.contains(id);
  }

  factory Crop.fromMap(Map<String, dynamic> map) {
    return Crop(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      scienticName: map['scienticName'] ?? '',
      imageURL: PhotoThumbails.fromMap(map['imageURL']),
      description: map['description'] ?? '',
      bookMarked: map['bookMarked'] ?? false,
      treatment: Treatment.fromMap(map['treatment']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Crop.fromJson(String source) => Crop.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Crop(id: $id, name: $name, scienticName: $scienticName, imageURL: $imageURL, description: $description, bookMarked: $bookMarked, treatment: $treatment)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Crop &&
        other.id == id &&
        other.name == name &&
        other.scienticName == scienticName &&
        other.imageURL == imageURL &&
        other.description == description &&
        other.bookMarked == bookMarked &&
        other.treatment == treatment;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        scienticName.hashCode ^
        imageURL.hashCode ^
        description.hashCode ^
        bookMarked.hashCode ^
        treatment.hashCode;
  }
}

class PhotoThumbails {
  final String caption;
  final String details;
  PhotoThumbails({
    required this.caption,
    required this.details,
  });

  PhotoThumbails copyWith({
    String? caption,
    String? details,
  }) {
    return PhotoThumbails(
      caption: caption ?? this.caption,
      details: details ?? this.details,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'caption': caption,
      'details': details,
    };
  }

  factory PhotoThumbails.fromMap(Map<String, dynamic> map) {
    return PhotoThumbails(
      caption: (map['caption'] ?? '') as String,
      details: (map['details'] ?? '') as String,
    );
  }
}

class Treatment {
  final String? intro;
  final List<String> steps;
  final String? outtro;
  Treatment({
    this.intro,
    required this.steps,
    this.outtro,
  });

  Treatment copyWith({
    String? intro,
    List<String>? steps,
    String? outtro,
  }) {
    return Treatment(
      intro: intro ?? this.intro,
      steps: steps ?? this.steps,
      outtro: outtro ?? this.outtro,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (intro != null) {
      result.addAll({'intro': intro});
    }
    result.addAll({'steps': steps});
    if (outtro != null) {
      result.addAll({'outtro': outtro});
    }

    return result;
  }

  factory Treatment.fromMap(Map<String, dynamic> map) {
    return Treatment(
      intro: map['intro'],
      steps: List<String>.from(map['steps'] ?? const []),
      outtro: map['outtro'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Treatment.fromJson(String source) =>
      Treatment.fromMap(json.decode(source));

  @override
  String toString() =>
      'Treatment(intro: $intro, steps: $steps, outtro: $outtro)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Treatment &&
        other.intro == intro &&
        listEquals(other.steps, steps) &&
        other.outtro == outtro;
  }

  @override
  int get hashCode => intro.hashCode ^ steps.hashCode ^ outtro.hashCode;
}
