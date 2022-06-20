import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class FileWidget extends StatelessWidget {
  final Uint8List content;
  final String fileName;
  final DateTime uploadDate;
  final Function() deleteFunction;

  const FileWidget(
      {Key? key,
      required this.content,
      required this.fileName,
      required this.uploadDate,
      required this.deleteFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.grey.shade300,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(children: [
            Image.memory(
              content,
              height: 60,
              width: 100,
              fit: BoxFit.contain,
            ),
            Container(width: 10),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(height: 5),
                Text(DateFormat("dd.MM.yyyy HH:mm").format(uploadDate),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w500))
              ],
            )),
            Container(width: 10),
            IconButton(
                onPressed: () async => await deleteFunction(),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.redAccent,
                ))
          ]),
        ));
  }
}
