import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pleez/my_colors.dart';

class Contact_us extends StatefulWidget {
  const Contact_us({Key? key}) : super(key: key);

  @override
  _Contact_usState createState() => _Contact_usState();
}

class _Contact_usState extends State<Contact_us> {



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),color: Colors.black,),
        title: Text("Contact us",style: TextStyle(fontSize: 25),),
        backgroundColor: Colors.white,
        elevation: 0,

      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0,left: 10),
            child: Text("CONTACT DETAILS",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
          ),
          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Email: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                Text("leechatme@gmail.com",style: TextStyle(fontSize: 15),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Address: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                Text("Chabihil, kathmandu",style: TextStyle(fontSize: 15),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Phone: ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                Text(" +977 9742555741 , +977 9742555743",style: TextStyle(fontSize: 15),)
              ],
            ),
          ),










        ],
      ),

    );
  }
}














