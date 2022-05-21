import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_firebase/firebase/auth.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String _pwd = "";
  String _mail = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Auth")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [
          Card(
            color: Colors.grey.shade200,
            child: Column(children: [
              Container(height: 10),
              const Text("Email and password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Container(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _mail = value;
                      });
                    },
                    decoration: const InputDecoration(label: Text("Email"))),
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
                    decoration: const InputDecoration(label: Text("Password"))),
              ),
              Container(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ElevatedButton(
                    onPressed: () async {
                      var res = await Auth.mailRegister(_mail, _pwd);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor:
                              res == null ? Colors.green : Colors.red,
                          content: Text(res ?? "Registered!")));
                    },
                    child: const Text("Register")),
                ElevatedButton(
                    onPressed: () async {
                      var res = await Auth.mailSignIn(_mail, _pwd);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor:
                              res == null ? Colors.green : Colors.red,
                          content: Text(res ?? "Logged in!")));
                    },
                    child: const Text("Login"))
              ]),
              Container(height: 10)
            ]),
          ),
          Container(height: 10),
          Card(
            color: Colors.grey.shade200,
            child: Column(children: [
              Container(height: 10),
              const Text("Login with Google",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
            color: Colors.grey.shade200,
            child: Column(children: [
              Container(height: 10),
              const Text("Log out",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
          )
        ]),
      ),
    );
  }
}
