import 'package:encryptedcloudstorage/Product.dart';
import 'package:encryptedcloudstorage/fileservice.dart';
import 'package:encryptedcloudstorage/home.dart';
import 'package:flutter/material.dart';
class LoadFilePage extends StatelessWidget {
  const LoadFilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Product>>(
          future: FileService().fileDisplay(),
            builder: (BuildContext context, AsyncSnapshot<List<Product>>snapshot) {
          if(snapshot.hasData){
            return HomeScreen(list: snapshot.data!.toList(),);
          }else{
            return const Center(child: CircularProgressIndicator());
          }
        }

    ),
    );
  }
}
