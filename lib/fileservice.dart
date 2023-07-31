import 'dart:convert';
import 'dart:io';

import 'package:encryptedcloudstorage/Product.dart';
import  'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FileService{

  Future uploadfile(File file , String token) async{
    final prefs = await SharedPreferences.getInstance();
    //getting stream from the file ie uploading file as a stream ;
    http.ByteStream stream = http.ByteStream(file.openRead());
    stream.cast();
    //getting length of the file we used
    var length = await file.length();
    // Obtain shared preferences.

    print(token);
    print(file.path);
    var tkn =  prefs.getString('token');
    String url =  "https://encryptproject.herokuapp.com/api/upload/add";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll({
      "auth-token": prefs.getString('token').toString(),
      "Content-Type": "application/json"
    });
    //this fields is used to store normal value  eg Map <Key , value>{ "id" : "xyz"}
    //here fields["keynamefromjson jast cha tei halna paro"]
    request.fields['id'] = token.toString();
    //request.files chai file send garna lai ho  jaha chai http.MultipartFile("key halnai paro",stream file ko mathi cha  ,length mathi cha,filename:k naam rakhera upload garne tw)
    request.files.add( http.MultipartFile('NAGRITAFRONT',stream,length
       ,filename: file.path.split("/").last));
    request.files.add( http.MultipartFile('P',stream,length
        ,filename: "NAGTROTA.jpg"));
    request.files.add( http.MultipartFile('NAGRITAFRONT',stream,length
        ,filename: "NAGTROTA.png"));

    var response = await request.send();

    if(response.statusCode == 200) {
      var resdata = await response.stream.toBytes();
      var result = String.fromCharCodes(resdata);
      var data = jsonDecode(result);
      print(data["message"]);
      return data["message"];
    }else {
      return "failed to Upload";
    }
  }
  Future <List<Product>> fileDisplay() async{
    final prefs = await SharedPreferences.getInstance();
    String url = "https://encryptproject.herokuapp.com/api/upload";
    var response  = await http.get(Uri.parse(url),
      headers: {"Content-Type": "application/json",
        "auth-token": prefs.getString('token').toString()
      },
    );
    if (response.statusCode == 400 || response.statusCode == 200) {
      final resp  = json.decode(response.body) as Map<String, dynamic> ;

      var jsonData = resp["data"];
      List<Product> alldata  = [];
      for(var value in jsonData){
        alldata.add(Product.fromJsom(value));
      }


      print(alldata);
      return alldata;


    } else {
      throw Exception('Failed to load data!');

    }




  }
  Future fileView(String id ,String key) async{
    final prefs = await SharedPreferences.getInstance();
    String url = "https://encryptproject.herokuapp.com/api/upload/$id/details?key=$key";
print(url);
    var response  = await http.get(Uri.parse(url),
      headers: {"Content-Type": "application/json",
        "auth-token": prefs.getString('token').toString()
      },
    );
    if (response.statusCode == 400 || response.statusCode == 200) {
      final resp  = json.decode(response.body) as Map<String, dynamic> ;

      var jsonData = resp["data"] ["image"];
      print(jsonData);

  return jsonData;

    } else {
      throw Exception('Failed to load data!');
    }




  }
}