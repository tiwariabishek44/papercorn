import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pleez/my_colors.dart';

class Privacy_policy extends StatefulWidget {
  const Privacy_policy({Key? key}) : super(key: key);

  @override
  _Privacy_policyState createState() => _Privacy_policyState();
}

class _Privacy_policyState extends State<Privacy_policy> {



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
        title: Text("Privacy and Policy",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
        backgroundColor: Colors.white,
        elevation: 0,

      ),
      body: ListView(
        children: [



          Padding(
            padding: const EdgeInsets.only(top: 40.0,left: 10),
            child: Text("Policy",style: TextStyle(fontSize: 25),),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("You can use our services in a variety of ways to manage your privacy. For example, you can sign up for a Google Account if you want to create and manage content like emails and photos, or see more relevant search results. And you can use many Google services when you’re signed out or without creating an account at all, like searching on Google or watching YouTube videos. You can also choose to browse the web in a private mode, like Chrome Incognito mode. And across our services, you can adjust your privacy settings to control what we collect and how your information is used.")
          ),









        ],
      ),

    );
  }
}














