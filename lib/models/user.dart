import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? id;
  int record;
  String name;
  String userName;  // Named required parameter
  String password;

  // Constructor with required 'userName'
  User({
    this.id,
    required this.record,
    required this.name,
    required this.userName,  // Make sure to pass userName when creating a User
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
      userName: data?['username'] as String? ?? '',  // Ensure 'userName' is fetched
      password: data?['password'] as String? ?? '',
    );
  }
}
