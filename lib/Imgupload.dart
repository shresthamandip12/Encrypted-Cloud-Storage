import 'package:encryptedcloudstorage/MainDrawer.dart';
import 'package:encryptedcloudstorage/uploadIcon.dart';
import 'package:flutter/material.dart';

class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({Key? key}) : super(key: key);

  @override
  State<ImageUploadScreen> createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
     appBar: AppBar(),
      drawer: MainDrawer(),
      body: const UploadIconScreen(),
    );
  }
}
