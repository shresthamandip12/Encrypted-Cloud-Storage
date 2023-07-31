import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ImageView extends StatelessWidget {
  String? url;
  ImageView({Key? key , this.url}) : super(key: key);

  String fun1(String url){
    String  imguri = "http://localhost:3000/uploads/encrypted_images/$url";

    return imguri;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        child: url != null?PhotoView(
          imageProvider: NetworkImage(fun1(url!).toString()),
        ):PhotoView(imageProvider: AssetImage("images/logo.png")),
      ),
    );
  }
}


