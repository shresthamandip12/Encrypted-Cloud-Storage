import 'dart:io';

import 'package:encryptedcloudstorage/MainDrawer.dart';
import 'package:encryptedcloudstorage/fileservice.dart';
import 'package:encryptedcloudstorage/home.dart';
import 'package:encryptedcloudstorage/loadpage.dart';
import 'package:encryptedcloudstorage/uploadIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
class UploadFileScreen extends StatefulWidget {
  const UploadFileScreen({Key? key}) : super(key: key);

  @override
  State<UploadFileScreen> createState() => _UploadFileScreenState();
}

class _UploadFileScreenState extends State<UploadFileScreen> {
  final _formkey1 = GlobalKey<FormState>();
  //file img jaha image file bascha gallery or camera bata tesko lagi
  File ? img;
  String? token;
  //yaha bata image liney
  Future getImage()async{
    ImagePicker picker = ImagePicker();
    
   //XFile?  file type  paile ako file chai Xfile bhitra bascha var bhaneko yah XFIle ho
    var image = await picker.pickImage(source: ImageSource.gallery);
   if(image == null) return;
   //yaha chai Xfile lai file ma change gareko ho
   final imagetemp = File(image.path);
   setState(() {
     //ani yaha chai img agi File declare gareko ma store garera rakhya ho
     img = imagetemp;
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const MainDrawer(),
      body:  SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration:   BoxDecoration(
            gradient: LinearGradient(
                begin : Alignment.topCenter,
                end  : Alignment.bottomCenter,
                colors: [

                  Colors.blue.shade100,
                  Colors.blue.shade50
                ]
            ),

          ),
          child: Column(
            children: [
              img==null?InkWell(
                onTap: (){
                  getImage();
                },
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  height: 200,
                  width: 290,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    boxShadow: const
                    [
                      BoxShadow(
                          color: Color.fromRGBO(27, 95, 225, .3),
                          blurRadius: 20,
                          offset: Offset(0, 10)
                      )],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset("images/cloud-uploading-svgrepo-com.svg",height: 150,width: 150,),
                      const Text("Upload File",style: TextStyle(fontFamily: 'font1',fontSize: 20,fontWeight: FontWeight.bold,letterSpacing: 1),)

                    ],
                  )

                ),
              ):Container(
                margin: EdgeInsets.only(top: 50),
                height: 200,
                width: 290,
                child:Image.file(img!),

              ),
              SizedBox(height: 40,),
              Container(
                height: 75,
                width: 340,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  boxShadow: const
                  [
                    BoxShadow(
                        color: Color.fromRGBO(27, 95, 225, .3),
                        blurRadius: 20,
                        offset: Offset(0, 10)
                    )],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(

                  padding: const EdgeInsets.all(8),
                  child:  Form(
                    key:_formkey1 ,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value){
                        if(value!.isEmpty){
                          String a = 'Token is required';
                          return a ;
                        }
                        return null;
                      },
                      onSaved: (input)=> token = input,
                      decoration: const InputDecoration(

                          hintText: "Create security key",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none
                      ),
                    ),
                  ),
                ),



              ),
              Container(
                  width:  120 ,
                  margin: const EdgeInsets.only(left: 40,bottom: 150),
                  child: ElevatedButton(
                    onPressed: (){
                      upload(context);
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                    child: const Text("Upload"),
                  )
              ),


            ],
          ),
        ),
      )
    );
  }
  upload(BuildContext context) async {
    if(_formkey1.currentState!.validate()){
      _formkey1.currentState!.save();
      var tkn = await   FileService().uploadfile(img!, token!);
      if(tkn == "File uploaded successfully" ){

        openDialogue(context, tkn, 1);

      }else{
        openDialogue(context, tkn, 0);
      }



    }
  }
  Future openDialogue(BuildContext context,String x ,int n) async{
    showDialog(context: context, builder: (_)=>AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius:BorderRadius.all(Radius.circular(30))
      ),
      content: Container(
        padding: EdgeInsets.only(left: 15),
        height: 120,
        width: 120,
        child: Center(child: Text(x,style: TextStyle(fontSize: 20,letterSpacing: 1.5
        ),),),
      ),
      actions: [

        TextButton(onPressed: () async {

          n == 1 ? Navigator.push(context, MaterialPageRoute(builder: (context)=> LoadFilePage()))  : Navigator.pop(context);

        }, child: Text("Ok"))
      ],
    ),
    );

  }
}

