import 'package:encryptedcloudstorage/User.dart';
import 'package:encryptedcloudstorage/login.dart';
import 'package:flutter/material.dart';

import 'authService.dart';
class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formkey1 = GlobalKey<FormState>();
  UserModel model =  UserModel();
  String? confirmpwd;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient:LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [
                      Colors.blue.shade900,
                      Colors.blue.shade800,

                    ]
                ),
              ),
            ),
            const Positioned(
              top: 80,
                left: 30,
                child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w600),)
            ),
            const Positioned(
              top:140,
                left: 30,
                child: Text("Register your Free account",style: TextStyle(color: Colors.white,fontSize: 20,),)
            ),
            Positioned(
              top: 200,
              child: Form(
                key: _formkey1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.only(right: 210) ,
                      child: const Text("Name",style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5
                      ),
                      ),
                    ),
                    Container(
                    padding: const EdgeInsets.only(left: 30,top: 5),
                       width: 310,
                        height: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(30),

                          ),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        validator: (value){
                          if(value!.isEmpty){
                            String a = 'Name is required';
                            return a ;
                          }
                          return null;
                        },
                        onSaved: (input)=> model.name = input,
                        decoration: const InputDecoration(
                            hintText: "Enter Name",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                        ),
                      ),


                      ),
                   const  SizedBox(height: 16,),
                    Container(
                      margin: const EdgeInsets.only(right: 210) ,
                      child: const Text("Email",style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5
                      ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 30,top: 5),
                      width: 310,
                      height: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(30),

                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value){
                          if(value!.isEmpty){
                            String a = 'Name is required';
                            return a ;
                          }
                          return null;
                        },
                        onSaved: (input)=> model.email = input,
                        decoration: const InputDecoration(
                            hintText: "name@example.com",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none

                        ),
                      ),
                    ),
                    const  SizedBox(height: 16,),
                    Container(
                      margin: const EdgeInsets.only(right: 180) ,
                      child: const Text("Phone",style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5
                      ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 30,top: 5),
                      width: 310,
                      height: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(30),

                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        validator: (value){
                          if(value!.isEmpty){
                            String a = 'Phone is required';
                            return a ;
                          }
                          return null;
                        },
                        onSaved: (input)=> model.phone = input,
                        decoration: const InputDecoration(
                            hintText: "984*******",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none

                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 180) ,
                      child: const Text("Password",style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5
                      ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 30,top: 5),
                      width: 310,
                      height: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(30),

                      ),
                      child:  TextFormField(
                        obscureText: true,
                        validator: (value){
                          if(value!.isEmpty){

                            String a = 'Password is required';
                            return a ;
                          }
                          if(value.length < 6){
                            return 'Passoword Length less than 6 ';
                          }
                          return null;
                        },
                        onSaved:  (input)=> model.password = input,
                        decoration: const InputDecoration(
                            hintText: "Enter Password",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                    const  SizedBox(height: 16,),
                    Container(
                      margin: const EdgeInsets.only(right: 120) ,
                      child: const Text("Confirm Password",style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1.5
                      ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 30,top: 5),
                      width: 310,
                      height: 60,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(30),

                      ),
                      child:  TextFormField(
                        obscureText: true,
                        validator: (value){
                          if(value!.isEmpty){

                            String a = 'Password is required';
                            return a ;
                          }
                          if(value.length < 6){
                            return 'Passoword Length less than 6 ';
                          }
                          return null;
                        },
                          onSaved: (input)=> confirmpwd = input,
                        decoration: const InputDecoration(
                            hintText: "Enter Password",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: InputBorder.none
                        ),
                      ),
                    ),
                  const   SizedBox(height:20),
                    Container(
                        width: 120,
                        margin: const EdgeInsets.only(left: 20,bottom: 150),
                        child: ElevatedButton(
                          onPressed: (){
                            registration(context);
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                          child: const Text("Sign Up",style: TextStyle(fontSize: 17,letterSpacing:1.5 ),),
                        )
                    ),
                  ]
                ),
              ),
            )
          ],

        ),
      ),
    );
  }
  registration(BuildContext context ) async {
    if(_formkey1.currentState!.validate()){
      _formkey1.currentState!.save();
      if(confirmpwd == model.password) {
        var data = "Ram";
        String? tkn = await AuthService().register(model: model);
        print("from reg $tkn");
        if(tkn == "Email already registered."){
          openDialogue(context, tkn!,0);

        }
        else if(  tkn != null && tkn != "Email already registered." ){
          openDialogue(context, "Your,Email is registered",1);
        }else{
          openDialogue(context, "Failed to registered",0);
        }
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

           n == 1 ? Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()))  : Navigator.pop(context);

          }, child: Text("Ok"))
        ],
      ),
    );

  }
}
