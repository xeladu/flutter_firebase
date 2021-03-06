import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/pages/auth_page.dart';
import 'package:flutter_firebase/pages/firestore_page.dart';
import 'package:flutter_firebase/pages/functions_page.dart';
import 'package:flutter_firebase/pages/storage_page.dart';
import 'package:flutter_firebase/widgets/custom_bottom_app_bar.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _State();
}

class _State extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text("Firebase Demo"))),
        bottomNavigationBar: const CustomBottomAppBar(),
        body: Center(
            child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
                color: Colors.grey.shade300,
                child: Image.asset("res/firebase_compendium_logo.png")),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AuthPage()));
                  },
                  child: const Text("Authentication"))),
          Container(height: 10),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FirestorePage()));
                  },
                  child: const Text("Cloud Firestore"))),
          Container(height: 10),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FunctionsPage()));
                  },
                  child: const Text("Cloud Functions"))),
          Container(height: 10),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const StoragePage()));
                  },
                  child: const Text("Storage"))),
        ])));
  }
}
