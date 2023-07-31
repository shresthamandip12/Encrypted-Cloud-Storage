import 'package:encryptedcloudstorage/Imgupload.dart';
import 'package:encryptedcloudstorage/fileupload.dart';
import 'package:encryptedcloudstorage/home.dart';
import 'package:encryptedcloudstorage/loadpage.dart';
import 'package:encryptedcloudstorage/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:  Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade900,
                  Colors.blue.shade800,
                  Colors.blue.shade600


                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter

              )
            ),
              child:  Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    height: 250,
                    width: MediaQuery.of(context).size.width,

                    child:   const Center(
                      child: Image(image: AssetImage("images/logo.png"),),
                    ),

                  ),
                  ListView(
                    shrinkWrap: true,
                    children:    [
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LoadFilePage()));
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide())
                          ),



                            child: ListTile(
                              title: const Text( "Home",
                                style: TextStyle(color: Colors.white70,letterSpacing: 1.3,
                                  fontSize: 30,fontWeight: FontWeight.w800,
                                  fontFamily: "font1",
                                ),


                              ),
                              leading: SvgPicture.asset("images/house.svg",width: 30,height: 30,color: Colors.white,),


                            ),

                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(bottom: BorderSide())
                        ),
                        child: ListTile(

                          title: const Text( "Upload File",style: TextStyle(color: Colors.white70,letterSpacing: 1.3,
                          fontSize: 30,fontWeight: FontWeight.w800,
                          fontFamily: "font1",
                            ),),
                          leading: SvgPicture.asset("images/cloud-uploading-svgrepo-com.svg",width: 30,height: 30,color: Colors.white,),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> UploadFileScreen()));
                          },
                        ),
                      ),

                      Container(
                        decoration: const BoxDecoration(
                            border: Border(bottom: BorderSide())
                        ),
                        child:   ListTile(
                          title: const Text( "Profile",style: TextStyle(color: Colors.white70,letterSpacing: 1.3,
                            fontSize: 30,fontWeight: FontWeight.w800,
                            fontFamily: "font1",
                          ),),
                          leading: SvgPicture.asset("images/user-profile-person-svgrepo-com.svg",width: 30,height: 30,color: Colors.white,),


                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(bottom: BorderSide())
                        ),
                        child:   ListTile(
                          title: const Text( "Log Out",style: TextStyle(color: Colors.white70,letterSpacing: 1.3,
                            fontSize: 30,fontWeight: FontWeight.w800,
                            fontFamily: "font1",
                          ),),
                          leading: SvgPicture.asset("images/user-profile-person-svgrepo-com.svg",width: 30,height: 30,color: Colors.white,),

                            onTap: () async{
                              final prefs = await SharedPreferences.getInstance();
                              final success = await prefs.remove("token").then((_) =>MaterialPageRoute(builder: (context)=> LoginScreen()) );

                            },
                        ),
                      )
                    ],
                  )

                ],
              ),
          ),

    ]
      ),
    );
  }
}
