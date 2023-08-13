class UserModel{
  UserModel({
    required this.userId,
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
    required this.ssc,
  });
  final String userId;
  final String username;
  final String email;
  final String password;
  final String phone;
  final String ssc;
  bool? isAgent=false;

  UserModel.fromJson(Map<String,dynamic> json):
        userId=json['userId']??"",
        username=json['username']??"",
        email=json['email']??"",
        password=json['password']??"",
        phone=json['phone']??"",
        ssc=json['ssc']??"",
        isAgent=json['isAgent']??false;


  Map<String,dynamic> toJson()=>{
    'userId':userId,
    'username':username,
    'email':email,
    'password':password,
    'phone':phone,
    'ssc':ssc,
    'isAgent':isAgent,
  };
  static List<Map<String,dynamic>> userModel=[
    {
      'userId':'1',
      'name':'Maisam',
      'email':'maisam@gmail.com',
      'password':'123',
      'phone':'123',
    },
    {
      'userId':'2',
      'name':'Mahmoud',
      'email':'Mahmoud@gmail.com',
      'password':'123',
      'phone':'123',
    },
    {
      'userId':'3',
      'name':'Hourani',
      'email':'Hourani@gmail.com',
      'password':'123',
      'phone':'123',
    },
  ];
}


class Registration {
  static Future<List<UserModel>> getUserData() async {
    await Future.delayed(Duration(seconds: 3));
    List<UserModel> userModelData = UserModel.userModel.map((e) =>
        UserModel.fromJson(e)).toList();
    return userModelData;
  }
}