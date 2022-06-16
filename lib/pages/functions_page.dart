import 'package:cloud_functions/cloud_functions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/widgets/custom_bottom_app_bar.dart';

class FunctionsPage extends StatefulWidget {
  const FunctionsPage({Key? key}) : super(key: key);

  @override
  State<FunctionsPage> createState() => _State();
}

class _State extends State<FunctionsPage> {
  String _upperText = "";
  String _lowerText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Firebase Functions"))),
      bottomNavigationBar: const CustomBottomAppBar(
          showGitHubLink: false,
          showMediumLink: false,
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
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                          "Convert text to upper case by calling a cloud function",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))),
                  Container(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _upperText = value;
                          });
                        },
                        decoration: const InputDecoration(label: Text("Text"))),
                  ),
                  Container(height: 10),
                  ElevatedButton(
                      onPressed: () async {
                        if (_upperText == "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text("Please provide some text!")));
                        } else {
                          var res = await FirebaseFunctions.instance
                              .httpsCallable("toUpperCase")
                              .call(_upperText);

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: Colors.green,
                              content: Text(res.data.toString())));
                        }
                      },
                      child: const Text("Send to cloud function")),
                  Container(height: 10)
                ]),
              ),
              Card(
                color: Colors.grey.shade300,
                child: Column(children: [
                  Container(height: 10),
                  const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                          "Convert text to lower case by calling an HTTP endpoint",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))),
                  Container(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _lowerText = value;
                          });
                        },
                        decoration: const InputDecoration(label: Text("Text"))),
                  ),
                  Container(height: 10),
                  ElevatedButton(
                      onPressed: () async {
                        if (_lowerText == "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text("Please provide some text!")));
                        } else {
                          var resp = await Dio().post(
                              "https://us-central1-dummy-fb52b.cloudfunctions.net/toLowerCase",
                              options: Options(contentType: "text/plain"),
                              data: _lowerText);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor: resp.statusCode == 200
                                  ? Colors.green
                                  : Colors.red,
                              content: Text(resp.statusCode == 200
                                  ? resp.data.toString()
                                  : resp.statusMessage!)));
                        }
                      },
                      child: const Text("Send to HTTP endpoint")),
                  Container(height: 10)
                ]),
              )
            ])
          ])),
    );
  }
}