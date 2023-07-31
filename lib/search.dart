


import 'package:encryptedcloudstorage/Fileviewpage.dart';
import 'package:encryptedcloudstorage/Product.dart';
import 'package:encryptedcloudstorage/constants.dart';
import 'package:encryptedcloudstorage/fileservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';





class Search extends StatefulWidget {
  final List <Product>list;

  const Search({Key? key,required this.list }) : super(key: key);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String? searchString;
  List <Product>  _list = [];
  final controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.blue.shade900,
                        Colors.blue.shade200,
                      ],
                      stops: const [0.1, 0.4, 0.7, 0.9],
                    )),
              ),
              Column(
                children: [
                  Row(children: [

                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 10, 0, 0),
                      child: Container(
                        width: size.width * 0.7,
                        height: 40,
                        decoration: BoxDecoration(
                          color: LightColor.primaryColor.withOpacity(0.02),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: LightColor.primaryColor,
                            width: 1.5,
                          ),
                        ),
                        child: TextField(
                          autofocus:false,
                          decoration: const InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: "Search By address",
                              prefixIcon: Icon(Icons.search),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 5,
                                vertical: 5,
                              )),
                          onChanged: (val) {
                            setState(() {
                              searchString = val.toLowerCase();
                              searchProduct(searchString!);
                            });
                          },
                        ),
                      ),
                    ),

                  ]),

                  const SizedBox(
                    height: 10,
                  ),

                  const SizedBox(height: 15,),

                  Container(
                    width: 500,
                    height: 500,
                    child: (searchString == null || searchString == '' )?const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text("What are you looking for?")):
                    ListView.builder(

                      itemCount: _list.length,
                        itemBuilder:(context, index){
                          var prd = _list[index];

                            return (_list.length == 0) ? Center(
                                child: Text("No Such Product result found")) :
                            GestureDetector(
                              onTap: () {


                              },
                              child: Container(
                                width: size.width,
                                height: 90,
                                child: Card(
                                  child: ListTile(
                                    title: Text(
                                      prd.imgname!,
                                    ),
                                    leading: SvgPicture.asset("images/filesvg.svg",),
                                  ),
                                ),
                              ),
                            );

                        }
                        ),
                  ),


                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  void searchProduct(String searchvalue ){

      setState(() {
        List <Product>list = widget.list.where((element) =>
        (element.imgname!
            .toLowerCase().contains(searchvalue) )).toList();
        _list = list;
        print("from sp morelist null $_list");
      });
    }
  Future openDialogue(BuildContext context,id) async{
    showDialog(context: context, builder: (_)=>AlertDialog(
      title: Text('Enter Token'),
      content: TextField(
        decoration: InputDecoration(hintText: "Enter your Key"),
        controller: controller,
      ),
      actions: [
        TextButton(onPressed: () async {
          var  data  =  await FileService().fileView(id, controller.text.toString());
          print("from home $data");
          if(data != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ImageView()));
          }
        }, child: Text("Submit"))
      ],
    ));

  }


}
