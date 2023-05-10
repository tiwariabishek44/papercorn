class UserDetailsModel {
  String? uid;
  String? email;
  String? Name;
  String? address;
  String? phoneno;


  UserDetailsModel({this.uid, this.email, this.Name, this.address,this.phoneno});

  // receiving data from server
  factory UserDetailsModel.fromMap(map) {
    return UserDetailsModel(
      uid: map['uid'],
      email: map['email'],
      Name: map['firstName'],
      address: map['address'],
      phoneno: map['phoneno'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': Name,
      'address': address,
      'phoneno': phoneno,
    };
  }

  factory UserDetailsModel.getModelFromJson(Map<String,dynamic>json){
    return UserDetailsModel(Name: json["firstName"],address: json["address"], phoneno: json["phoneno"]);
  }
}