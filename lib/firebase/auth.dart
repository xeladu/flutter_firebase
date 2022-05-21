import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  static Future<String?> mailRegister(String mail, String pwd) async {
    try {
      var res = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: mail, password: pwd);
      print("Mail: ${res.user?.email}");
      print("Display Name: ${res.user?.displayName}");
      print("User Name: ${res.additionalUserInfo?.username}");
      print("Method: ${res.credential?.signInMethod}");
      print("Token: ${res.credential?.token}");
      print("User UID: ${res.user?.uid}");
      return null;
    } on FirebaseAuthException catch (ex) {
      return "${ex.code}: ${ex.message}";
    }
  }

  static Future<String?> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return null;
    } on FirebaseAuthException catch (ex) {
      return "${ex.code}: ${ex.message}";
    }
  }

  static Future<String?> mailSignIn(String mail, String pwd) async {
    try {
      var res = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail, password: pwd);
      print("Mail: ${res.user?.email}");
      print("Display Name: ${res.user?.displayName}");
      print("User Name: ${res.additionalUserInfo?.username}");
      print("Method: ${res.credential?.signInMethod}");
      print("Token: ${res.credential?.token}");
      print("User UID: ${res.user?.uid}");
      return null;
    } on FirebaseAuthException catch (ex) {
      return "${ex.code}: ${ex.message}";
    }
  }

  static Future<String?> googleSignIn() async {
    try {
      var res =
          await FirebaseAuth.instance.signInWithPopup(GoogleAuthProvider());
      print("Mail: ${res.user?.email}");
      print("Display Name: ${res.user?.displayName}");
      print("User Name: ${res.additionalUserInfo?.username}");
      print("Method: ${res.credential?.signInMethod}");
      print("Token: ${res.credential?.token}");
      print("User UID: ${res.user?.uid}");
      return null;
    } on FirebaseAuthException catch (ex) {
      return "${ex.code}: ${ex.message}";
    } on UnimplementedError catch (ex) {
      return ex.message;
    }
  }
}
