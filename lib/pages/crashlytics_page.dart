import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class CrashlyticsPage extends StatefulWidget {
  const CrashlyticsPage({super.key});

  @override
  State<CrashlyticsPage> createState() => _State();
}

class _State extends State<CrashlyticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: const Center(child: Text("Firebase Crashlytics"))),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    onPressed: _createCrashReport,
                    child: const Text("Create crash report"),
                  )),
              const SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    onPressed: _createCrashReportWithLogs,
                    child: const Text("Create crash report with logs"),
                  )),
              const SizedBox(height: 10),
              const Text(
                  "Check your Crashlytics dashboard in Firebase to see the crash report details!")
            ])));
  }

  Future _createCrashReport() async {
    FirebaseCrashlytics.instance
        .recordError(Exception("Test"), StackTrace.current, fatal: true);
  }

  Future _createCrashReportWithLogs() async {
    FirebaseCrashlytics.instance.log("This is a log message");
    FirebaseCrashlytics.instance
        .recordError(Exception("Test"), StackTrace.current, fatal: true);
  }
}
