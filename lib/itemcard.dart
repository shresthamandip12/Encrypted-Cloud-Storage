import 'package:encryptedcloudstorage/Fileviewpage.dart';
import 'package:encryptedcloudstorage/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ProductCard extends StatelessWidget {
  final Product list ;
  const ProductCard({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
     Container(
        margin: const EdgeInsets.only(top: 6,left: 19),
        child: Row(

                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          width: 85,
                          height:90,
                          decoration: const BoxDecoration(
                             boxShadow:
                          [
                          BoxShadow(
                          color: Color.fromRGBO(27, 95, 225, .3),
                            blurRadius: 20,
                            offset: Offset(0, 10)
                        )],
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25)
                            ),
                          ),
                          child: SvgPicture.asset("images/filesvg.svg",),

                        ),
                        Container(
                          width: 245,
                          height: 90,
                          decoration:  BoxDecoration(
                            boxShadow:   const [
                              BoxShadow(
                                  color: Colors.white70,
                                  blurRadius: 20,
                                  offset: Offset(0, 10)
                              )],
                            gradient: LinearGradient(colors: [
                              Colors.blue.shade900,
                              Colors.blue.shade800,
                            ]),

                            borderRadius: const BorderRadius.only(bottomRight: Radius.circular(25),topRight: Radius.circular(25)
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 20,
                                  left: 10,
                                  child: Column(
                                children:  [
                                  Text("${list.imgname}",style: const TextStyle(
                                    letterSpacing: 1,fontSize: 20,
                                      fontWeight: FontWeight.w900,fontFamily: "font1",
                                    color: Colors.white70
                                  ),),
                                ],
                              ))
                            ],

                          ),
                        )
                      ],

          ),

    );





  }
}
