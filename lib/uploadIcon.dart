import 'package:flutter/material.dart';
class UploadIconScreen extends StatelessWidget {
  const UploadIconScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child:  Container(
        height:160,
        width: 160,
        margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(),
            borderRadius: BorderRadius.circular(10),
              boxShadow:  <BoxShadow> [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  blurRadius: 10.0,
                  spreadRadius: 1,
                  offset:Offset (0,5),
                ),
              ],

            ),
        child: const Center(child: Icon(Icons.cloud_upload,size: 80,)),

      ),
    );
  }
}
