import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/firebase/auth.dart';
import 'package:flutter_firebase/widgets/custom_bottom_app_bar.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _State();
}

class _State extends State<AuthPage> {
  String _pwd = "";
  String _mail = "";
  User? _user;

  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.authStateChanges().listen((user) {
      setState(() {
        _user = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Firebase Auth"))),
      bottomNavigationBar: const CustomBottomAppBar(
          showGitHubLink: false,
          customMediumLink:
              "https://levelup.gitconnected.com/how-to-use-firebase-authentication-with-your-flutter-app-4603c1b78156?sk=b0a7caf1e0316507e6e56af63c77cd49"),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(children: [
            ListView(children: [
              Card(
                color: Colors.grey.shade300,
                child: Column(children: [
                  Container(height: 10),
                  const Text("Email and password",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Container(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _mail = value;
                          });
                        },
                        decoration:
                            const InputDecoration(label: Text("Email"))),
                  ),
                  Container(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _pwd = value;
                          });
                        },
                        decoration:
                            const InputDecoration(label: Text("Password"))),
                  ),
                  Container(height: 10),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              var res = await Auth.mailRegister(_mail, _pwd);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: res == null
                                          ? Colors.green
                                          : Colors.red,
                                      content: Text(res ?? "Registered!")));
                            },
                            child: const Text("Register")),
                        ElevatedButton(
                            onPressed: () async {
                              var res = await Auth.mailSignIn(_mail, _pwd);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: res == null
                                          ? Colors.green
                                          : Colors.red,
                                      content: Text(res ?? "Logged in!")));
                            },
                            child: const Text("Login"))
                      ]),
                  Container(height: 10)
                ]),
              ),
              Container(height: 10),
              Card(
                color: Colors.grey.shade300,
                child: Column(children: [
                  Container(height: 10),
                  const Text("Login with Google",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Container(height: 10),
                  ElevatedButton(
                      onPressed: () async {
                        var res = await Auth.googleSignIn();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor:
                                res == null ? Colors.green : Colors.red,
                            content: Text(res ?? "Logged in!")));
                      },
                      child: const Text("Login with Google")),
                  Container(height: 10)
                ]),
              ),
              Container(height: 10),
              Card(
                color: Colors.grey.shade300,
                child: Column(children: [
                  Container(height: 10),
                  const Text("Log out",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Container(height: 10),
                  ElevatedButton(
                      onPressed: () async {
                        var res = await Auth.signOut();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor:
                                res == null ? Colors.green : Colors.red,
                            content: Text(res ?? "Logged out!")));
                      },
                      child: const Text("Sign out")),
                  Container(height: 10)
                ]),
              ),
              Container(height: 10),
              if (_user != null)
                Card(
                    color: Colors.grey.shade300,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("User data",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Container(height: 10),
                            Text("Mail: ${_user?.email}"),
                            Text("Display Name: ${_user?.displayName}"),
                            Text("User UID: ${_user?.uid}")
                          ]),
                    ))
            ]),
            Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  _user != null ? "Logged in" : "Logged out",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: _user != null ? Colors.green : Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ))
          ])),
    );
  }
}
