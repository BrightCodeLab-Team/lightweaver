import 'dart:math';

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

  // 1. Generate 6-digit OTP
  String generateOTP({int length = 6}) {
    final random = Random();
    return List.generate(length, (_) => random.nextInt(10)).join();
  }

  // 2. Save OTP and send email (call email API here)
  sendOtpToEmail(String email) async {
    final otp = generateOTP();
    print("otp send $otp");

    // Store OTP with timestamp
    await _db.collection('password_reset_otps').doc(email).set({
      'otp': otp,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });

    print('OTP sent to $email: $otp');

    // TODO: Replace this print with actual email sending code via:
    // - Firebase Function
    // - SendGrid API
    // - Mailgun
    // - Custom backend
  }
}
