import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:example/models/chapter.dart';

class Challenge {
  String? id;
  String name;
  List<Chapter> chapters;

  Challenge({
    this.id,
    required this.name,
    required this.chapters,
  });

  /// Factory constructor to create a `Challenge` object from Firestore data.
  factory Challenge.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();

    return Challenge(
      id: snapshot.id,
      name: data?['name'] as String? ?? '',
      chapters: (data?['chapters'] as List<dynamic>?)
              ?.map((item) => Chapter.fromJson(item))
              .toList() ??
          [],
    );
  }

  /// Factory constructor to create a `Challenge` object from JSON.
  factory Challenge.fromJson(Map<String, dynamic> json) {
    return Challenge(
      id: json['id'] as String?,
      name: json['name'] as String? ?? '',
      chapters: (json['chapters'] as List<dynamic>?)
              ?.map((item) => Chapter.fromJson(item))
              .toList() ??
          [],
    );
  }
}
