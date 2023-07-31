import 'package:encryptedcloudstorage/User.dart';

import  'package:http/http.dart' as http;
import 'dart:convert' ;

import 'package:shared_preferences/shared_preferences.dart';
class AuthService{
 Future <String> login( UserModel model) async{
   final prefs = await SharedPreferences.getInstance();
   var data  = json.encode({
     "email" : model.email.toString().trim(),
     "password": model.password.toString().trim()

   });
   String url = "https://encryptproject.herokuapp.com/api/user/login";
   var response  = await http.post(Uri.parse(url), headers: {"Content-Type": "application/json"},
   body:data,
   );


   if ( response.statusCode == 200 || response.statusCode == 400) {
     final resp  = json.decode(response.body) as Map<String, dynamic> ;

   var tkn = resp["data"];
if( tkn != null) {
  await prefs.setString('token', tkn);
  return resp["message"];
}else{
  print(resp["message"]);


  return resp["message"];

}

   } else {
     throw Exception('Failed to load data!');
     //return "Failed to load data";
   }



 }
 Future  register({required UserModel model}) async{
   var data = json.encode({
     "name" : model.name,
     "email" : model.email,
     "password": model.password,
     "phone" : model.phone


   });
   String url = "https://encryptproject.herokuapp.com/api/user/register";
   var response  = await http.post(Uri.parse(url), headers: {"Content-Type": "application/json"},
     body:data,
   );
   if (response.statusCode == 200 || response.statusCode == 400) {
     final resp  =  json.decode(response.body.toString())as Map<String, dynamic> ;
     String ? tkn = resp["data"];
     var message = resp["message"];
     if(tkn != null){
       return tkn;
     }
        else{
          return message ;

     }


   }
   else {
     throw Exception('Failed to load data!');
   }



 }

}