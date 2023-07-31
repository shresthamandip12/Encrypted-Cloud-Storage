import 'package:encryptedcloudstorage/User.dart';
import 'package:encryptedcloudstorage/authService.dart';
import 'package:encryptedcloudstorage/home.dart';
import 'package:encryptedcloudstorage/loadpage.dart';
import 'package:encryptedcloudstorage/registration.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey1 = GlobalKey<FormState>();
  UserModel model =  UserModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(

          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient:LinearGradient(
                begin: Alignment.topCenter,
                  colors: [
                Colors.blue.shade900,
                Colors.blue.shade800,
                Colors.blue.shade400,
                  ]
              ),
            ),
            child: Form(
              key: _formkey1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:   [
                  const SizedBox(
                    height: 80,
                  ),

              Container(
                margin: const EdgeInsets.only(left: 30),
                  child: const Text("Login",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w600),)
              ),
                  Container(
                      margin: const EdgeInsets.only(left: 30,top: 10,bottom: 10),
                      child: const Text("Welcome Back",style: TextStyle(color: Colors.white,fontSize: 20),)
                  ),
                const SizedBox(height: 30,),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,

                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(60) ,topRight: Radius.circular(60) )
                    ),
                    child: Padding(

                      padding: const EdgeInsets.all(30),
                      child: Column(
                        children: [
                          const SizedBox(height: 40,),
                          Container(
                            height: 75,
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
                              child:  TextFormField(
                              keyboardType: TextInputType.emailAddress,
                                validator: (value){
                                  if(value!.isEmpty){
                                    String a = 'Email is required';
                                    return a ;
                                  }
                                  return null;
                                },
                                onSaved: (input)=> model.email = input,
                                decoration: const InputDecoration(

                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none
                                ),
                              ),
                            ),


                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 15),
                            height: 75,
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
                              child:  TextFormField(
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
                                obscureText: true,
                                onSaved: (input)=> model.password = input,

                                decoration: const InputDecoration(

                                    hintText: "Enter Password",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 80,
                              margin: const EdgeInsets.only(top: 50),
                              child: const Text("Forget Password?",style: TextStyle(color: Colors.grey),),
                            ),
                          ),
                           Container(
                             margin: const EdgeInsets.only(bottom:10),
                                 child: Row(
                                  children: [
                                    Container(
                                      width:  120 ,
                                        margin: const EdgeInsets.only(left: 40,bottom: 150),
                                        child: ElevatedButton(
                                          onPressed: (){
                                                    login(context);
                                        },
                                           style: ElevatedButton.styleFrom(
                                             shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.circular(20)
                                             )
                                           ),
                                            child: const Text("Login"),
                                        )
                                    ),
                                    Container(
                                      width: 120,
                                        margin: const EdgeInsets.only(left: 20,bottom: 150),
                                        child: ElevatedButton(
                                            onPressed: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationScreen()));
                                            },
                                          style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20)
                                              )
                                          ),
                                            child: const Text("Sign Up"),
                                        )
                                    ),
                                  ],
                          ),
                               ),


                        ],
                      ),
                    ),
                ),
                ),



                ],
              ),
            ),
          ),
        ),
    );
  }
  login(BuildContext context )  async {
    if(_formkey1.currentState!.validate()){
      _formkey1.currentState!.save();
    String tkn = await   AuthService().login(model);

  print("from lgn" +tkn );
      if(tkn == "User logged in" ){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadFilePage()));
      }else{
        openDialogue(context, tkn);
      }

    }
  }
  Future openDialogue(BuildContext context,String x ) async{
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

          Navigator.pop(context);

        }, child: Text("Ok"))
      ],
    ),
    );

  }
}
