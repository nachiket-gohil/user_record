import 'package:firebase_auth/firebase_auth.dart';
import 'package:user_record/config/analytics_mixin.dart';

import '../model/auth_user_model.dart';

class RemoteDataSource with GoogleAnalyticsMixin {
  final FirebaseAuth firebaseAuth;

  RemoteDataSource(this.firebaseAuth);

  Future<User?> getAuthUser() async {
    gaLogEvent(
      eventName: 'checking_user_logged_in',
    );
    return firebaseAuth.currentUser;
  }

  Future<AuthUserModel> login(String email, String password) async {
    UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    gaLogEvent(
      eventName: 'user_login',
    );
    return AuthUserModel(
      id: userCredential.user!.uid,
      email: userCredential.user!.email!,
    );
  }

  Future<AuthUserModel> signUp(String email, String password) async {
    UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    gaLogEvent(
      eventName: 'user_signup',
    );
    return AuthUserModel(
      id: userCredential.user!.uid,
      email: userCredential.user!.email!,
    );
  }

  Future<void> logout() async {
    gaLogEvent(
      eventName: 'user_logout',
    );
    await firebaseAuth.signOut();
  }
}
