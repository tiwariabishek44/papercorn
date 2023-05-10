
import 'package:pleez/models/user_details_model.dart';
import 'package:pleez/resources/cloudfirestore_method.dart';
import 'package:flutter/material.dart';

class UserDetailsProvider with ChangeNotifier {
  UserDetailsModel userDetails;

  UserDetailsProvider()
      : userDetails = UserDetailsModel(Name: "Loading", address: "Loading");

  Future getData() async {
    userDetails = await CloudFirestoreClass().getNameAndAddress();

    notifyListeners();
  }
}