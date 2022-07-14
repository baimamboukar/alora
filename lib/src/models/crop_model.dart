// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Crop {
  final String name;
  final String scienticName;
  final PhotoThumbails imageURL;
  final String description;
  final bool bookMarked;
  Crop({
    required this.name,
    required this.scienticName,
    required this.imageURL,
    required this.description,
    required this.bookMarked,
  });

  Crop copyWith({
    String? name,
    String? scienticName,
    PhotoThumbails? imageURL,
    String? description,
    bool? bookMarked,
  }) {
    return Crop(
      name: name ?? this.name,
      scienticName: scienticName ?? this.scienticName,
      imageURL: imageURL ?? this.imageURL,
      description: description ?? this.description,
      bookMarked: bookMarked ?? this.bookMarked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'scienticName': scienticName,
      'imageURL': imageURL,
      'description': description,
      'bookMarked': bookMarked,
    };
  }

  factory Crop.fromMap(Map<String, dynamic> map) {
    return Crop(
      name: (map['name'] ?? '') as String,
      scienticName: (map['scienticName'] ?? '') as String,
      imageURL: PhotoThumbails.fromMap(map['imageURL'] ?? ''),
      description: (map['description'] ?? '') as String,
      bookMarked: (map['bookMarked'] ?? false) as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Crop.fromJson(String source) =>
      Crop.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Crop(name: $name, scienticName: $scienticName, imageURL: $imageURL, description: $description, bookMarked: $bookMarked)';
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
