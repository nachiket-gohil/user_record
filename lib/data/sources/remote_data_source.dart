import 'package:firebase_auth/firebase_auth.dart';

import '../model/auth_user_model.dart';

class RemoteDataSource {
  final FirebaseAuth firebaseAuth;

  RemoteDataSource(this.firebaseAuth);

  Future<AuthUserModel> login(String email, String password) async {
    UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
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
    return AuthUserModel(
      id: userCredential.user!.uid,
      email: userCredential.user!.email!,
    );
  }

  Future<void> logout() async {
    await firebaseAuth.signOut();
  }
}
