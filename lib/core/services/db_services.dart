import 'package:cloud_firestore/cloud_firestore.dart' hide Order;
import 'package:flutter/material.dart';
import 'package:lightweaver/core/model/app_user.dart';

class DatabaseServices {
  final _db = FirebaseFirestore.instance;
  static final DatabaseServices _singleton = DatabaseServices._internal();

  factory DatabaseServices() {
    return _singleton;
  }

  DatabaseServices._internal();

  /// Register app user
  registerAppUser(AppUser user) async {
    debugPrint("User @Id => ${user.id}");
    try {
      await _db
          .collection('app_user')
          .doc(user.id)
          .set(user.toJson())
          .then((value) => debugPrint('user registered successfully'));
    } catch (e, s) {
      debugPrint('Exception @DatabaseService/registerAppUser');
      debugPrint(s.toString());
      return false;
    }
  }

  Future<void> updateUserVerificationStatus(
    String userId,
    bool isVerified,
  ) async {
    try {
      await _db.collection('app_user').doc(userId).update({
        'isEmailVerified': isVerified,
        'updatedAt': Timestamp.now(),
      });
    } catch (e, s) {
      debugPrint('Exception @updateUserVerificationStatus');
      debugPrint(s.toString());
    }
  }

  updateUser(AppUser user) async {
    debugPrint("User @Id => ${user.id}");
    try {
      await _db
          .collection('app_user')
          .doc(user.id)
          .set(user.toJson())
          .then((value) => debugPrint('user updated successfully'));
    } catch (e, s) {
      debugPrint('Exception @DatabaseService/updateUser');
      debugPrint(s.toString());
      return false;
    }
  }

  ///
  /// Get user from the database using this function
  ///
  Future<AppUser> getAppUser(String id) async {
    debugPrint('@getAppUser: id: $id');
    try {
      final snapshot = await _db.collection("app_user").doc(id).get();
      if (snapshot.exists) {
        print('User Data: ${snapshot.data()}');
        return AppUser.fromJson(snapshot.data()!);
      } else {
        print('User not found');

        return AppUser();
      }
    } catch (e, s) {
      print('Exception @DatabaseService/getAppUser');
      print(s.toString());
      return AppUser();
    }
  }

  checkUser(AppUser user) async {
    //Todo: Rename getUsers -> getUser
    debugPrint('@getAppUser: id: ${user.id}');
    try {
      final snapshot = await _db.collection('app_user').doc(user.id).get();
      if (snapshot.exists) {
        return true;
      } else {
        return false;
      }
    } catch (e, s) {
      debugPrint('Exception @DatabaseService/getAppUser');
      debugPrint(s.toString());
      return false;
    }
  }
}
