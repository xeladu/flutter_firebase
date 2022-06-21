import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/firebase/storage.dart';
import 'package:flutter_firebase/widgets/custom_bottom_app_bar.dart';
import 'package:flutter_firebase/widgets/file_widget.dart';
import 'package:image_picker/image_picker.dart';

class StoragePage extends StatefulWidget {
  const StoragePage({Key? key}) : super(key: key);

  @override
  State<StoragePage> createState() => _State();
}

class _State extends State<StoragePage> {
  bool _uploadRunning = false;
  String _buttonCaption = "Select file to upload";
  UploadTask? _task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text("Firebase Storage"))),
        bottomNavigationBar: const CustomBottomAppBar(
            showGitHubLink: false,
            showMediumLink: true,
            customMediumLink:
                "https://levelup.gitconnected.com/how-to-easily-store-objects-in-firebase-storage-from-your-flutter-app-deabc475d407"),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(children: [
              Card(
                  color: Colors.grey.shade300,
                  child: Column(children: [
                    Container(height: 10),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Upload a file to storage",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold))),
                    Container(height: 10),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      ElevatedButton(
                          onPressed: _uploadRunning
                              ? null
                              : () async {
                                  var img = await _pickImage();
                                  if (img == null) return;

                                  try {
                                    _task = Storage.uploadItem(
                                        File(img.path), img.name);

                                    _uploadRunning = true;
                                    setState(() {});

                                    _task!.snapshotEvents.listen((snapshot) {
                                      if (snapshot.state == TaskState.running) {
                                        _buttonCaption =
                                            "Uploading ... ${(100.0 * (snapshot.bytesTransferred / snapshot.totalBytes)).toStringAsFixed(0)}%";
                                        _uploadRunning = true;
                                        setState(() {});
                                        return;
                                      }

                                      if (snapshot.state == TaskState.success) {
                                        _uploadRunning = false;
                                        _buttonCaption =
                                            "Select file to upload";
                                        _task = null;
                                        setState(() {});
                                        return;
                                      }
                                    });
                                  } on FirebaseException catch (ex) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor: Colors.red,
                                            content: Text(ex.message!)));
                                  }
                                },
                          child: Text(_buttonCaption)),
                      Container(width: 10),
                      if (_uploadRunning && _task != null)
                        IconButton(
                            onPressed: () async {
                              await _task!.cancel();
                              _uploadRunning = false;
                              _buttonCaption = "Select file to upload";
                              setState(() {});
                            },
                            icon: const Icon(Icons.stop_circle_outlined,
                                size: 36, color: Colors.blueAccent))
                    ]),
                    Container(height: 10)
                  ])),
              Container(height: 10),
              FutureBuilder(
                  future: Storage.getData(),
                  initialData: const <String>[],
                  builder: (ctx, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else {
                        if (_uploadRunning) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        var data = snapshot.data as List<FileData>;
                        if (data.isEmpty) {
                          return Card(
                              color: Colors.grey.shade300,
                              child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Center(
                                      child: Text(
                                          "No data, please upload some files!"))));
                        } else {
                          return Column(
                              children: data
                                  .map((item) => FileWidget(
                                        content: item.content,
                                        fileName: item.name,
                                        uploadDate: item.uploadDate,
                                        deleteFunction: () async {
                                          await Storage.deleteItem(
                                              item.reference);

                                          setState(() {});
                                        },
                                      ))
                                  .toList());
                        }
                      }
                    }

                    return const Center(child: CircularProgressIndicator());
                  })
            ])));
  }

  Future<XFile?> _pickImage() async {
    final ImagePicker _picker = ImagePicker();

    return await _picker.pickImage(source: ImageSource.gallery);
  }
}
