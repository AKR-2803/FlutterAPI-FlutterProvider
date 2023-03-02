//Save to Local Storage using, http, path and path_provider packages
//The downloaded image file is Visible in PC only
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;

class PreviewDownload extends StatefulWidget {
  final String imageUrl;
  const PreviewDownload({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<PreviewDownload> createState() => _PreviewDownloadState();
}

class _PreviewDownloadState extends State<PreviewDownload> {
  bool _visible = true;
  //img that will be displayed, in the beginning it is null
  File? _displayImage;
  //if true, screen will show downloading...
  bool _isDownloading = false;
  //download URL
  late final String _downloadUrl = widget.imageUrl;

  @override
  void initState() {
    super.initState();
  }

  Future<void> _download() async {
    setState(() {
      _isDownloading = true;
    });

    final response = await http.get(Uri.parse(_downloadUrl));

    //get image name
    final imageName = path.basename(_downloadUrl);
    // final appDir = await path_provider.getApplicationDocumentsDirectory();
    final appDir = await path_provider.getExternalStorageDirectory();

    //to display image from localPath
    final localPath = path.join(appDir!.path, imageName);
    final imageFile = File(localPath);

    await imageFile.writeAsBytes(response.bodyBytes);

    setState(() {
      _isDownloading = false;
      _displayImage = imageFile;
      print("localpath................................$localPath");
      print("imageFile................................$imageFile");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: _download, child: const Text('Download Image')),
        const SizedBox(height: 5),
        _displayImage != null
            ? Visibility(
                visible: _visible,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _visible = !_visible;
                      });
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(fontSize: 15),
                    )),
              )
            : Center(
                child: _isDownloading
                    ? const Text(
                        'Downloading...',
                        style: TextStyle(fontSize: 15),
                      )
                    : null,
              )
      ],
    );
  }
}


//Gallery Saver (Did not work)
/*

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:image_downloader/image_downloader.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;

class PreviewDownload extends StatefulWidget {
  final String imageUrl;
  const PreviewDownload({Key? key, required this.imageUrl}) : super(key: key);

  @override
  State<PreviewDownload> createState() => _PreviewDownloadState();
}

class _PreviewDownloadState extends State<PreviewDownload> {
  late final String _downloadUrl = widget.imageUrl;

  save() async {
    try {
      var imageId = await ImageDownloader.downloadImage("https://i.imgflip.com/1bij.jpg");
      if (imageId == null) {
        print(
            "ImageId................................. : null.........$imageId");
      }

      var path = await ImageDownloader.findPath(imageId!);
      //ignore:avoid_print
      print("..........................path : $path");
    } on PlatformException catch (e) {
      //ignore:avoid_print
      print("..............................error occured: $e");
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        child: TextButton(
          onPressed: () {
            save();
          },
          child: const Text("Download"),
        ));
  }
}
*/

