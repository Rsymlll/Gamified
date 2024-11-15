import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? id;
  int record;
  String name;
  String username;
  String password;

  User({
    this.id,
    required this.record,
    required this.name,
    required this.username,
    required this.password,
  });

  /// Factory constructor to create a `User` object from Firestore
  factory User.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();

    return User(
      id: snapshot.id,
      record: data?['record'] as int? ?? 0,
      name: data?['name'] as String? ?? '',
      username: data?['username'] as String? ?? '',
      password: data?['password'] as String? ?? '',
    );
  }
}
