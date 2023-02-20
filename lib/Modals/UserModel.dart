import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataList {
  static List<UserModal> usersList = [];
}

class UserModal {
  final String uid;
  final String name;
  final String email;
  final String address;
  final String contact;

  UserModal(
      {required this.name,
      required this.email,
      required this.address,
      required this.uid,
      required this.contact});

  static UserModal fromSnapshot(DocumentSnapshot snapshot) {
    return UserModal(
        name: snapshot["name"],
        uid: snapshot["uid"],
        email: snapshot["email"],
        address: snapshot["address"],
        contact: snapshot["contact"]);
  }
}
