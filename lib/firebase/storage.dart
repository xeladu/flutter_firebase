import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class Storage {
  static Future<List<FileData>> getData() async {
    final ref = FirebaseStorage.instance.ref();

    var files = await ref.list(const ListOptions(maxResults: 5));
    var res = <FileData>[];

    for (var item in files.items) {
      var content = await item.getData();
      var created = (await item.getMetadata()).timeCreated!;

      res.add(FileData(content!, item.name, created, item));
    }

    return res;
  }

  static Future deleteItem(Reference ref) async {
    await ref.delete();
  }

  static UploadTask uploadItem(File file, String targetName) {
    final ref = FirebaseStorage.instance.ref();

    var child = ref.child(targetName);

    // With the UploadTask object you can listen to progress changes and control
    // the upload
    return child.putFile(file);
  }
}

class FileData {
  final Uint8List content;
  final String name;
  final DateTime uploadDate;
  final Reference reference;

  FileData(this.content, this.name, this.uploadDate, this.reference);
}
