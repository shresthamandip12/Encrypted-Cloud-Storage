import 'package:encryptedcloudstorage/Imgupload.dart';
import 'package:encryptedcloudstorage/fileupload.dart';
import 'package:encryptedcloudstorage/home.dart';
import 'package:encryptedcloudstorage/homepage.dart';
import 'package:encryptedcloudstorage/itemcard.dart';
import 'package:encryptedcloudstorage/login.dart';
import 'package:encryptedcloudstorage/registration.dart';
import 'package:encryptedcloudstorage/search.dart';
import 'package:encryptedcloudstorage/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:SplashScreen(),
    );
  }
}
class TestPage extends StatelessWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CircularProgressIndicator(),
    );
  }
}



