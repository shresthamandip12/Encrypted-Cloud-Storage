class UserModel{
   String? name ;
   String? email;
  String? phone;
  String? password;
  String? message;
  String? data;
  UserModel();
  UserModel.forLogin({required this.email , required this.password});
  UserModel.forRegistration({required this.email , required this.name , required this.password , required this.phone});
}