import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseHelper {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// تسجيل الدخول للمستخدم
  Future<void> loginUser(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }

  /// إنشاء حساب جديد
  Future<void> registerUser(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw Exception('Registration failed: ${e.toString()}');
    }
  }

  User? getCurrentUser() {
    return auth.currentUser;
  }

  /// تسجيل الخروج
  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      throw Exception('Sign-out failed: ${e.toString()}');
    }
  }

  Future<void> createUser({
    required String email,
    required String name,
    required String password,
    String? image = '',
  }) async {
    try {
      final user = auth.currentUser;
      if (user == null) {
        throw Exception('No user is currently signed in');
      }

      await firestore.collection('users').doc(user.uid).set({
        'userId': user.uid,
        'password': password,
        'email': email,
        "name": name,
        "image": image,
      });
    } catch (e) {
      throw Exception('Failed to create user in Firestore: ${e.toString()}');
    }
  }
}
