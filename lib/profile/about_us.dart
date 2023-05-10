import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pleez/my_colors.dart';

class About_us extends StatefulWidget {
  const About_us({Key? key}) : super(key: key);

  @override
  _About_usState createState() => _About_usState();
}

class _About_usState extends State<About_us> {



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
        title: Text("About us",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0,

      ),
      body: ListView(
        children: [




          SizedBox(height: 20,),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("A Terms and Conditions is not required and it's not mandatory by law.Unlike Privacy Policies, which are required by laws such as the GDPR, CalOPPA and many others, there's no law or regulation on Terms and Conditions. However, having a Terms and Conditions gives you the right to terminate the access of abusive users or to terminate the access to users who do not follow your rules and guidelines, as well as other desirable business benefits.It's extremely important to have this agreement if you operate a SaaS app.Here are a few examples of how this agreement can help you:If users abuse your website or mobile app in any way, you can terminate their account. Your 'Termination' clause can inform users that their accounts would be terminated if they abuse your service.If users can post content on your website or mobile app (create content and share it on your platform), you can remove any content they created if it infringes copyright. Your Terms and Conditions will inform users that they can only create and/or share content they own rights to. Similarly, if users can register for an account and choose a username, you can inform users that they are not allowed to choose usernames that may infringe trademarks, i.e. usernames like Google, Facebook, ")
          ),









        ],
      ),

    );
  }
}














