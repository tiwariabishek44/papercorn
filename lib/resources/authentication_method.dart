import 'package:pleez/models//user_details_model.dart';
import 'package:pleez/resources/cloudfirestore_method.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationMethods {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  CloudFirestoreClass cloudFirestoreClass = CloudFirestoreClass();

  Future<String> signUpUser(
      {required String name,
        required String address,
        required String phoneno,
        required String email,
        required String password}) async {
    name.trim();
    address.trim();
    email.trim();
    password.trim();
    String output = "Something went wrong";
    if (name != "" && address != "" && phoneno != "" && email != "" && password != "") {
      try {
        await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        UserDetailsModel user = UserDetailsModel(Name: name, address: address,);
        await postDetailsToFirestore(firstnamee: name,addresss: address, phoneno: phoneno);
        output = "success";
      }  catch (e) {
        output = e.toString();
      }
    } else {
      output = "Please fill up all the fields.";
    }
    return output;
  }

  Future<String> signInUser(
      {required String email, required String password}) async {
    email.trim();
    password.trim();
    String output = "Something went wrong";
    if (email != "" && password != "") {
      try {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
        output = "success";
      } on FirebaseAuthException catch (e) {
        output = e.message.toString();
      }
    } else {
      output = "Please fill up all the fields.";
    }
    return output;
  }




  postDetailsToFirestore(
      {required firstnamee,required addresss, required phoneno}
      ) async {
    // calling our firestore
    // calling our user model
    // sedning these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = firebaseAuth.currentUser;

    UserDetailsModel userModel = UserDetailsModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.Name = firstnamee;
    userModel.address = addresss;
    userModel.phoneno=phoneno;



    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());

  }
}

