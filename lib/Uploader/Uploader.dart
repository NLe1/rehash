import 'dart:convert';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class UploaderPage extends StatefulWidget {
  final File file;

  // STATE
  StorageUploadTask _uploadTask;
  StorageReference _reference;
  bool _doneUploading = true;
  bool _calledAPI = false;
  String _imageURL = "";
  String _resultSorting = "";

  //CONSTANT
  final API_URL = "https://api.clarifai.com/v2/models/";
  final API_ID = "rehash-model";
  final API_KEY = "42db63a1f25a42dca73dc2344212faae";
  final API_VERSION_ID = "119aae7da89d4511b41c05fa138a39db";

  UploaderPage({Key key, this.file}) : super(key: key);

  createState() => _UploaderPageState();
}

class _UploaderPageState extends State<UploaderPage> {
  final FirebaseStorage _storage =
      FirebaseStorage(storageBucket: 'gs://rehash.appspot.com/');

  void _startUpload() {
    String filePath = 'images/${DateTime.now()}.png';

    setState(() {
      widget._reference = _storage.ref().child(filePath);
      widget._uploadTask = widget._reference.putFile(widget.file);
    });
  }

  void _callAPI() async {
    var downloadURL = await widget._reference.getDownloadURL();
    setState(() {
      widget._calledAPI = true;
      widget._imageURL = downloadURL;
    });

    final url = widget.API_URL +
        widget.API_ID +
        "/versions/" +
        widget.API_VERSION_ID +
        "/outputs";
    print(url);

    var headers = {
      "Content-type": "application/json",
      "Authorization": "Key " + widget.API_KEY
    };

    var body = json.encode({
      "inputs": [
        {
          "data": {
            "image": {"url": widget._imageURL}
          }
        }
      ]
    });

    http.Response res = await http.post(url, headers: headers, body: body);
    var resObj = json.decode(res.body);
    var arr = resObj['outputs'][0]['data']['concepts'];
    var names = [
      "Recycable Bottle",
      "Reusable Bottle",
      "Trash",
      "Recycable Can"
    ];
    var maxIndexItem = 0;
    for (int i = 1; i < arr.length; i++) {
      if (arr[i]['value'] > arr[maxIndexItem]['value']) {
        maxIndexItem = i;
      }
    }

    print(names[maxIndexItem]);

    setState(() {
      widget._resultSorting = names[maxIndexItem];
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget._uploadTask != null) {
      return StreamBuilder<StorageTaskEvent>(
        stream: widget._uploadTask.events,
        builder: (context, snapshot) {
          var event = snapshot?.data?.snapshot;

          double progressPercent =
              event != null ? event.bytesTransferred / event.totalByteCount : 0;

          return Column(
            children: [
              LinearProgressIndicator(value: progressPercent),
              Text('${(progressPercent * 100).toStringAsFixed(2)} %'),
              widget._doneUploading && widget._uploadTask.isComplete
                  ? RaisedButton(
                      child: Text("Sort"),
                      onPressed: _callAPI,
                    )
                  : Text(""),
              widget._resultSorting == ""
                  ? Text("")
                  : Text(widget._resultSorting),
            ],
          );
        },
      );
    } else {
      return FlatButton.icon(
        label: Text("Upload to Cloud"),
        icon: Icon(Icons.cloud_upload),
        onPressed: _startUpload,
      );
    }
  }
}
