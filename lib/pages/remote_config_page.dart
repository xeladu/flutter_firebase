import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/widgets/custom_bottom_app_bar.dart';

class RemoteConfigPage extends StatefulWidget {
  const RemoteConfigPage({Key? key}) : super(key: key);

  @override
  State<RemoteConfigPage> createState() => _State();
}

class _State extends State<RemoteConfigPage> {
  String platformString = "Hello!";

  @override
  void initState() {
    super.initState();

    FirebaseRemoteConfig.instance.fetchAndActivate().then((_) {
      platformString =
          FirebaseRemoteConfig.instance.getString("platformString");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: const Center(child: Text("Firebase Remote Config"))),
        bottomNavigationBar: const CustomBottomAppBar(
            showGitHubLink: false,
            showMediumLink: true,
            customMediumLink:
                "https://levelup.gitconnected.com/how-to-use-server-side-configurations-with-firebase-remote-config-3996b5606079"),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: Text(platformString,
                    style: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold)))));
  }
}
