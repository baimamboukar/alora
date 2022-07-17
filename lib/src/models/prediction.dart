import 'dart:convert';

class Prediction {
  final String description;
  final String prediction;
  final String source;
  final String symptoms;
  Prediction({
    required this.description,
    required this.prediction,
    required this.source,
    required this.symptoms,
  });

  Prediction copyWith({
    String? description,
    String? prediction,
    String? source,
    String? symptoms,
  }) {
    return Prediction(
      description: description ?? this.description,
      prediction: prediction ?? this.prediction,
      source: source ?? this.source,
      symptoms: symptoms ?? this.symptoms,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'description': description,
      'prediction': prediction,
      'source': source,
      'symptoms': symptoms,
    };
  }

  factory Prediction.fromMap(Map<String, dynamic> map) {
    return Prediction(
      description: (map['description'] ?? '') as String,
      prediction: (map['prediction'] ?? '') as String,
      source: (map['source'] ?? '') as String,
      symptoms: (map['symptoms'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Prediction.fromJson(String source) =>
      Prediction.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Prediction(description: $description, prediction: $prediction, source: $source, symptoms: $symptoms)';
  }
}
