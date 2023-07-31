class Product{
  String ? tkn;

  String? prid;
  String? imgname;

  Product.fromJsom(Map<String, dynamic> data){
    tkn = data["owner"]["_id"];
    prid = data["_id"];
    imgname = data["image"];



  }
}