import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/pages/auth_page.dart';
import 'package:flutter_firebase/pages/firestore_page.dart';
import 'package:flutter_firebase/pages/functions_page.dart';
import 'package:flutter_firebase/pages/remote_config_page.dart';
import 'package:flutter_firebase/pages/storage_page.dart';
import 'package:flutter_firebase/widgets/custom_bottom_app_bar.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FirebaseAppCheck.instance.activate();

  // do not use these durations in production as the server limit will be reached very quickly!
  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(minutes: 1),
  ));
  await FirebaseRemoteConfig.instance
      .setDefaults(const {"platformString": "Hello!"});

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
        appBar:
            AppBar(title: const Center(child: Text("Flutter Firebase Demo"))),
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
          Container(height: 10),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RemoteConfigPage()));
                  },
                  child: const Text("Remote Config"))),
        ])));
  }
}
