import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:lightweaver/core/model/app_user.dart';
import 'package:lightweaver/core/model/custom_auth_result.dart';
import 'package:lightweaver/core/services/auth_exception.dart';
import 'package:lightweaver/core/services/db_services.dart';
import 'package:lightweaver/custom_widget/snack_bar/custom_snack_bar.dart';

class AuthServices {
  final DatabaseServices _dbService = DatabaseServices();
  static final AuthServices instance = AuthServices();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookSignIn = FacebookAuth.instance;
  User? user;
  bool isLogin = false;
  AppUser appUser = AppUser();

  AuthServices() {
    init();
  }

  Future<void> init() async {
    user = _auth.currentUser;
    isLogin = user != null;
    if (isLogin) {
      appUser = await _dbService.getAppUser(user!.uid);
    }
  }

  ///
  /// [SignUp]
  ///

  Future<CustomAuthResult> signUpWithEmailPassword(AppUser appUser) async {
    CustomAuthResult customAuthResult = CustomAuthResult();
    try {
      final credentials = await _auth.createUserWithEmailAndPassword(
        email: appUser.email!,
        password: appUser.password!,
      );

      if (credentials.user == null) {
        return CustomAuthResult(
          status: false,
          errorMessage: 'An undefined error happened.',
        );
      }
      // Send email verification
      await credentials.user!.sendEmailVerification();

      appUser.id = credentials.user!.uid;
      this.appUser = appUser;
      customAuthResult.status = true;
      customAuthResult.user = credentials.user;

      await _dbService.registerAppUser(appUser);
    } catch (e) {
      debugPrint('Exception @signUpWithEmailPassword: $e');
      customAuthResult.status = false;
      customAuthResult
          .errorMessage = AuthExceptionsService.generateExceptionMessage(e);
    }
    return customAuthResult;
  }

  ///
  /// [SignIn]
  ///
  Future<CustomAuthResult> loginWithEmailPassword(AppUser appUser) async {
    CustomAuthResult customAuthResult = CustomAuthResult();
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: appUser.email!,
        password: appUser.password!,
      );

      if (credential.user != null) {
        appUser = await _dbService.getAppUser(credential.user!.uid);
        customAuthResult.status = true;
        customAuthResult.user = credential.user;
      } else {
        customAuthResult.status = false;
        customAuthResult.errorMessage = 'An undefined error happened';
      }
    } catch (e) {
      customAuthResult.status = false;
      customAuthResult
          .errorMessage = AuthExceptionsService.generateExceptionMessage(e);
    }
    return customAuthResult;
  }

  Future<bool> logout() async {
    try {
      await _auth.signOut();
      isLogin = false;
      user = null;
      return true;
    } catch (e) {
      debugPrint("Exception@authService/Logout ==> $e");
      return false;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email).then((value) {
        debugPrint('Email Sent');
        customSnackbar(title: 'Success', message: 'Password reset email sent!');
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        customSnackbar(title: 'Error', message: 'User Not Found');
      } else {
        customSnackbar(
          title: 'Error',
          message: e.message ?? 'Something went wrong',
        );
      }

      debugPrint(e.toString());
      return Future.error(e.toString());
    }
  }

  Future<CustomAuthResult> signupWithFacebook() async {
    CustomAuthResult customAuthResult = CustomAuthResult();
    try {
      final LoginResult result = await _facebookSignIn.login();

      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final firebaseAuthCred = FacebookAuthProvider.credential(
          accessToken.tokenString,
        );
        final loginResult = await FirebaseAuth.instance.signInWithCredential(
          firebaseAuthCred,
        );
        final userData = await _facebookSignIn.getUserData();

        appUser = AppUser(
          id: loginResult.user!.uid,
          name: userData['name'],
          email: userData['email'],
        );

        isLogin = true;
        bool isUserExist = await _dbService.checkUser(appUser);
        if (isUserExist) {
          appUser = await _dbService.getAppUser(appUser.id!);
        } else {
          await _dbService.registerAppUser(appUser);
        }

        customAuthResult.status = true;
        customAuthResult.user = appUser;
      } else {
        customAuthResult.status = false;
        customAuthResult.errorMessage = 'Facebook login failed.';
      }
    } catch (e) {
      customAuthResult.status = false;
      customAuthResult
          .errorMessage = AuthExceptionsService.generateExceptionMessage(e);
    }
    return customAuthResult;
  }

  Future<CustomAuthResult> loginWithGoogle() async {
    CustomAuthResult customAuthResult = CustomAuthResult();
    try {
      await _googleSignIn.signOut();

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        customAuthResult.errorMessage = "Google sign-in aborted.";
        return customAuthResult;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final authResult = await _auth.signInWithCredential(credential);

      appUser = AppUser(
        id: authResult.user!.uid,
        email: authResult.user!.email,
        name: authResult.user!.displayName ?? '',
      );

      isLogin = true;
      bool isUserExist = await _dbService.checkUser(appUser);
      if (isUserExist) {
        appUser = await _dbService.getAppUser(appUser.id!);
      } else {
        await _dbService.registerAppUser(appUser);
      }

      customAuthResult.status = true;
      customAuthResult.user = appUser;
    } catch (e) {
      customAuthResult.status = false;
      customAuthResult
          .errorMessage = AuthExceptionsService.generateExceptionMessage(e);
    }
    return customAuthResult;
  }

  // new code
}
