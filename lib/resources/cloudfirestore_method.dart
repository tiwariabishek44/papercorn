import 'dart:typed_data';

import 'package:pleez/models/product_model.dart';
import 'package:pleez/models/user_details_model.dart';
import 'package:pleez/utils/utils.dart';
import 'package:pleez/widget/simple_product_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import '../models/order_request.dart';
import '../models/review_model.dart';

class CloudFirestoreClass {

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;






  Future getNameAndAddress() async {
    DocumentSnapshot snap = await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .get();

    UserDetailsModel userModel = UserDetailsModel.getModelFromJson(
      (snap.data() as dynamic),
    );





    return userModel;
  }


  Future<String> uploadProductToDatabase({
    required Uint8List? image,
    required String productName,
    required String rawCost,
    required String gcash,
    required int discount,
    required String sellerName,
    required String sellerUid,
  }) async {
    productName.trim();
    rawCost.trim();
    String output = "Something went wrong";

    if (image != null && productName != "" && rawCost != "") {
      try {
        String uid = Utils().getUid();
        String url = await uploadImageToDatabase(image: image, uid: uid);

        double cost = double.parse(rawCost);
        double Gcash = double.parse(gcash);
        double aftercash =cost - Gcash;

        cost = cost - (1);

        ProductModel product = ProductModel(
            url: url,
            productName: productName,
            cost: cost,
            gcash: Gcash,
            aftercash: aftercash,
            discount: discount,
            uid: uid,
            sellerName: sellerName,
            sellerUid: sellerUid,
            rating: 5,
            noOfRating: 0);

        await firebaseFirestore
            .collection("copy")
            .doc(uid)
            .set(product.getJson());
        output = "success";
      } catch (e) {
        output = e.toString();
      }
    } else {
      output = "Please make sure all the fields are not empty";
    }

    return output;
  }

  Future<String> uploadImageToDatabase(
      {required Uint8List image, required String uid}) async {
    Reference storageRef =
    FirebaseStorage.instance.ref().child("copy").child(uid);
    UploadTask uploadToask = storageRef.putData(image);
    TaskSnapshot task = await uploadToask;
    return task.ref.getDownloadURL();
  }
  //
  Future<List<Widget>> getProductsFromDiscount(int discount) async {

    List<Widget> children = [];
    QuerySnapshot<Map<String, dynamic>> snap = await firebaseFirestore
        .collection("copy")
        .where("discount", isEqualTo: discount)
        .get();

    for (int i = 0; i < snap.docs.length; i++) {
      DocumentSnapshot docSnap = snap.docs[i];
      ProductModel model =
      ProductModel.getModelFromJson(json: (docSnap.data() as dynamic));
      children.add(SimpleProductWidget(productModel: model));
    }
    return children;
  }
  //
  //
  Future addProductToCart({required ProductModel productModel}) async {

    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .collection("cart")
        .doc(productModel.uid)
        .set(productModel.getJson());


  }

  //
  Future deleteProductFromCart({required String uid}) async {
    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .collection("cart")
        .doc(uid)
        .delete();
  }
  Future sums({required String uid}) async {

  }
  //
  Future buyAllItemsInCart({required UserDetailsModel userDetails}) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .collection("cart")
        .get();

    num sume = 0;
    for (int i = 0; i < snapshot.docs.length; i++) {
      ProductModel model =
      ProductModel.getModelFromJson(json: snapshot.docs[i].data());
      addProductToOrders(model: model, userDetails: userDetails);
      num sum = 0;
      for (num e in [model.cost]) {
        sum += e;

      }
      sume +=sum;

      await deleteProductFromCart(uid: model.uid);

    };
    print(sume);
    return sume;
  }
  Future summe({required UserDetailsModel userDetails}) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .collection("cart")
        .get();
    num sume = 0;
    for (int i = 0; i < snapshot.docs.length; i++) {
      ProductModel model =
      ProductModel.getModelFromJson(json: snapshot.docs[i].data());
      addProductToOrders(model: model, userDetails: userDetails);
      num sum = 0;
      for (num e in [model.cost]) {
        sum += e;}
      sume +=sum;};
    print(sume);
    return sume;
  }

  Future dd({required UserDetailsModel userDetails}) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .collection("cart")
        .get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      ProductModel model =
      ProductModel.getModelFromJson(json: snapshot.docs[i].data());
      addProductToOrders(model: model, userDetails: userDetails);

      await deleteProductFromCart(uid: model.uid);
      print("johntiwari");
    }



  }


  Future addProductToOrders(
      {required ProductModel model,
        required UserDetailsModel userDetails}) async {
    await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .collection("orders")
        .add(model.getJson());

    await sendOrderRequest(model: model, userDetails: userDetails);
  }

  Future sendOrderRequest(
      {
        required ProductModel model,
        required UserDetailsModel userDetails
      }) async {
    OrderRequestModel orderRequestModel = OrderRequestModel(
        orderName: model.productName, buyersAddress:"${userDetails.address}",buyersName: "${userDetails.Name}",phoneno: "${userDetails.phoneno}", afterprice: "${model.aftercash}");
    await firebaseFirestore
        .collection("users")
        .doc(model.sellerUid)
        .collection("orderRequests")
        .add(orderRequestModel.getJson());

  }

  Future getrequestodder() async {
    DocumentSnapshot snap = await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .get();

    UserDetailsModel userModel = UserDetailsModel.getModelFromJson(
      (snap.data() as dynamic),
    );

    return userModel;
  }
//
// //
//   //

}