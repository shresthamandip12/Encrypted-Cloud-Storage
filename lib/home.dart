import 'package:encryptedcloudstorage/Fileviewpage.dart';
import 'package:encryptedcloudstorage/MainDrawer.dart';
import 'package:encryptedcloudstorage/Product.dart';
import 'package:encryptedcloudstorage/fileservice.dart';
import 'package:encryptedcloudstorage/itemcard.dart';
import 'package:encryptedcloudstorage/search.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  List<Product> ?list ;

   HomeScreen({Key? key , this.list}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    controller.clear();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        title: Container(
          padding: EdgeInsets.only(top: 2),
          height: 50,
          width: 260,
          decoration:  BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),

          ),
          child: InkWell(
            onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Search(list: widget.list!,)));
    },
            child: const TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search_outlined),
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey,fontSize: 20),
                  border: InputBorder.none
              ),
            ),
          ),
        ),
        toolbarHeight: 65,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight:Radius.circular(40) )
        ),
      ),
      body: Container(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:   [
            const SizedBox(
              height: 100,
            ),

            Container(
                margin: const EdgeInsets.only(left: 30),
                child: const Text("Your Activity",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w600),)
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

                  padding: const EdgeInsets.all(5),
                  child:SingleChildScrollView(
                    child:
                    ListView.builder(shrinkWrap: true,physics: const ScrollPhysics(),
                        itemCount: widget.list!.length,
                        itemBuilder: (cntx , index){
                          return   InkWell(
                            onTap: (){
                              openDialogue(context,widget.list![index].prid);
                            },
                              child: ProductCard(list: widget.list![index],));
                        }
                    ),

                  ),
                ),
              ),
            ),



          ],
        ),
      ),


    );
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
