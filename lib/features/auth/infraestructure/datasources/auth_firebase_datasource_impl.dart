import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:outmap/features/auth/domain/datasource/auth_firebase_datasource.dart';

import '../errors/auth_errors.dart';
import '../models/user.dart';

final FirebaseAuth _authFirebase = FirebaseAuth.instance;
final CollectionReference<Map<String, dynamic>> users =
    FirebaseFirestore.instance.collection('users');

class AuthFirebaseDatasourceImpl extends AuthFirebaseDataSource {
  @override
  Future<String> checkAuthStatus() async {
    String message = '';
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        message = 'User is currently signed out!';

        // state = state.copyWith(errorMessage: 'User is currently signed out!');
      } else {
        message = 'User is signed in!';
      }
    });
    return message;
  }

  @override
  Future<User> login({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      print('credentials login: $credential');
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        throw CustomError('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        throw CustomError('Wrong password provided for that user.');
      }
      throw Exception();
    }
  }

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<User> register({
    required String email,
    required String password,
    required String fullName,
    required String gender,
    required String type,
    String? photoURL,
  }) async {
    try {
      final credential = await _authFirebase.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user == null) throw CustomError("don't have user");

      final user = await createUserInDatabase(userCredential: credential.user!);

      return user as User;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomError('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomError('The account already exists for that email.');
      }
      throw Exception();
    } catch (e) {
      debugPrint('Error: $e');
      throw Exception();
    }
  }

  @override
  Future<User> loginWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    final userFacebook = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
    // final user = userFacebook.user;
    final user = await createUserInDatabase(
      userCredential: userFacebook.user!,
      isFacebook: true,
    );
    return user!;
  }

  @override
  Future<User> loginWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
          'email',
        ],
      );

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final user = await createUserInDatabase(
        userCredential: userCredential.user!,
        isGoogle: true,
      );

      return user ?? userCredential.user!;
    } on FirebaseAuthException catch (e) {
      debugPrint('Error Firebase: $e');
      throw Exception();
    } catch (e) {
      debugPrint('Error: $e');
      throw Exception();
    }
  }

  Future<User?> createUserInDatabase({
    required User userCredential,
    bool isGoogle = false,
    bool isFacebook = false,
  }) async {
    UserModel user = UserModel.fromJson({
      "id": userCredential.uid,
      "fullName": userCredential.displayName,
      "email": userCredential.email,
      "photoURL": userCredential.photoURL,
      "isGoogle": isGoogle,
      "isFacebook": isFacebook,
    });
    return user as User;
  }
}
