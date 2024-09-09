import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/pages/auth_page.dart';
import 'package:flutter_firebase/pages/crashlytics_page.dart';
import 'package:flutter_firebase/pages/firestore_page.dart';
import 'package:flutter_firebase/pages/functions_page.dart';
import 'package:flutter_firebase/pages/remote_config_page.dart';
import 'package:flutter_firebase/pages/storage_page.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:url_launcher/url_launcher.dart';

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
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white)),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _State();
}

class _State extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: const Center(child: Text("Flutter Firebase Demo"))),
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
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FirestorePage()));
                  },
                  child: const Text("Cloud Firestore"))),
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FunctionsPage()));
                  },
                  child: const Text("Cloud Functions"))),
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const StoragePage()));
                  },
                  child: const Text("Storage"))),
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const RemoteConfigPage()));
                  },
                  child: const Text("Remote Config"))),
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CrashlyticsPage()));
                  },
                  child: const Text("Crashlytics"))),
          const SizedBox(height: 10),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Card(
                  shadowColor: Colors.black,
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                              child: Text("THE FLUTTER FIREBASE COMPENDIUM",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))),
                          const SizedBox(height: 8),
                          const Text("▶ Set up Firebase services in minutes",
                              style: TextStyle(fontSize: 16)),
                          const Text("▶ Build Flutter apps backed by Firebase",
                              style: TextStyle(fontSize: 16)),
                          const Text(
                              "▶ Understand pros and cons of Firebase services",
                              style: TextStyle(fontSize: 16)),
                          const Text(
                              "▶ Decide what Firebase features you should use",
                              style: TextStyle(fontSize: 16)),
                          const SizedBox(height: 8),
                          Center(
                            child: ActionChip(
                                backgroundColor: Colors.lightBlue.shade200,
                                avatar: const Icon(Icons.arrow_right_alt),
                                onPressed: () async {
                                  await launchUrl(
                                      Uri.parse(
                                          "https://xeladu.gumroad.com/l/ffc"),
                                      mode: LaunchMode.externalApplication);
                                },
                                label: const Text("Get it on Gumroad!")),
                          )
                        ]),
                  ))),
        ])));
  }
}
