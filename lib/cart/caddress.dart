import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pleez/my_colors.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Address",style: TextStyle(fontSize: 30),),
        backgroundColor: Colors.white,
        elevation: 0,

      ),
      body: ListView(
        children: [




          SizedBox(height: 20,),
          Padding(
              padding: const EdgeInsets.all(8.0),
                ),









        ],
      ),

    );
  }
}














