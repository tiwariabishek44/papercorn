import 'package:community_material_icon/community_material_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pleez/catageory/Books/dashboard.dart';
import 'package:pleez/catageory/Other_items/dashboard.dart';
import 'package:pleez/catageory/gir/gir.dart';
import 'package:pleez/profile/about_us.dart';
import 'package:pleez/profile/contact.dart';
import 'package:pleez/profile/privacy_policy.dart';
import 'package:pleez/profile/profilie.dart';
import 'package:pleez/profile/terms_and_condition.dart';
import 'package:pleez/screen/OrderRequestScreen.dart';
import 'package:pleez/screen/account_screen.dart';
import 'package:pleez/screen/sell_screen.dart';
import 'package:pleez/screen/sign_in.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pleez/home_screen/data.dart';
import 'package:pleez/home_screen/detail_screen.dart';
import 'package:pleez/my_colors.dart';

import '../catageory/Copy/dashboard.dart';
import '../models/user_details_model.dart';
import '../providers/user_detail_provider.dart';
import '../utils/color_themes.dart';

class Profile_Landings extends StatefulWidget {
  const Profile_Landings({Key? key}) : super(key: key);

  @override
  _Profile_LandingsState createState() => _Profile_LandingsState();
}

class _Profile_LandingsState extends State<Profile_Landings> {


  @override
  Widget build(BuildContext context) {
    UserDetailsModel userDetailsModel =
        Provider.of<UserDetailsProvider>(context).userDetails;
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      body: ListView(
        children: [
          if(userDetailsModel.Name=="sellerid")...[



            Container(decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
              color: Colors.redAccent,
              gradient: LinearGradient(
                colors: backgroundGradient,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
              height: 300,

              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 38.0,bottom: 16),
                    child: CircleAvatar(
                      radius: 72.0,

                      backgroundImage: AssetImage('assets/john.jpg'),
                    ),
                  ),
                  Text( "${userDetailsModel.Name}",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.black),),
                  SizedBox(height: 10,),
                  Text( "${userDetailsModel.address}",style: TextStyle(fontSize: 18,color: Colors.black87),),




                ],

              ),
            ),
            SizedBox(height: 10,),






            SizedBox(height: 1,),

            GestureDetector(onTap: (){
              Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: SellScreen()));

            },
              child: ListTile(
                  tileColor: Colors.white,

                  title: Text("Sell",style: TextStyle(fontSize: 20),),


                  trailing: Icon(Icons.arrow_forward_ios)
              ),
            ),
            SizedBox(height: 1,),

            GestureDetector(onTap: (){
              Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: OrderRequestScreen()));

            },
              child: ListTile(
                  tileColor: Colors.white,

                  title: Text("Order Request",style: TextStyle(fontSize: 20),),


                  trailing: Icon(Icons.arrow_forward_ios)
              ),
            ),
            SizedBox(height: 1,),




            SizedBox(height: 1,),
            GestureDetector(onTap: (){FirebaseAuth.instance.signOut();
            },
              child: ListTile(
                  tileColor: Colors.white,

                  title: Text("LogOut",style: TextStyle(fontSize: 20),),


                  trailing: Icon(Icons.arrow_forward_ios)
              ),
            ),

            SizedBox(height: 3.5,),




          ]else...[
            Container(decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)),
              color: Colors.redAccent,
              gradient: LinearGradient(
                colors: backgroundGradient,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
              height: 300,

              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 38.0,bottom: 16),
                    child: CircleAvatar(
                      radius: 72.0,

                      backgroundImage: AssetImage('assets/OIP.jpg'),
                    ),
                  ),
                  Text( "${userDetailsModel.Name}",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.black),),
                  SizedBox(height: 10,),
                  Text( "${userDetailsModel.address}",style: TextStyle(fontSize: 18,color: Colors.black87),),




                ],

              ),
            ),
            SizedBox(height: 10,),






            SizedBox(height: 1,),

            GestureDetector(onTap: (){
              Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: AccountScreen()));

            },
              child: ListTile(
                  tileColor: Colors.white,

                  title: Text("My Order",style: TextStyle(fontSize: 20),),


                  trailing: Icon(Icons.arrow_forward_ios)
              ),
            ),
            SizedBox(height: 1,),

            GestureDetector(onTap: (){
            },
              child: ListTile(
                  tileColor: Colors.white,

                  title: Text('Share',style: TextStyle(fontSize: 20),),


                  trailing: Icon(Icons.arrow_forward_ios)
              ),
            ),
            SizedBox(height: 1,),

            GestureDetector(onTap: (){
              Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: Contact_us()));
            },
              child: ListTile(
                  tileColor: Colors.white,

                  title: Text("Contact Us",style: TextStyle(fontSize: 20),),


                  trailing: Icon(Icons.arrow_forward_ios)
              ),
            ),
            SizedBox(height: 1,),

            GestureDetector(onTap: (){
              Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: Terms_and_condition()));
            },
              child: ListTile(
                  tileColor: Colors.white,

                  title: Text("Terms And Conditions",style: TextStyle(fontSize: 20),),


                  trailing: Icon(Icons.arrow_forward_ios)
              ),
            ),

            SizedBox(height: 1,),
            GestureDetector(onTap: (){
              Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: Privacy_policy()));
            },
              child: ListTile(
                  tileColor: Colors.white,

                  title: Text("Privacy Policy",style: TextStyle(fontSize: 20),),


                  trailing: Icon(Icons.arrow_forward_ios)
              ),
            ),

            SizedBox(height: 1,),
            GestureDetector(onTap: (){
              Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: About_us()));
            },
              child: ListTile(
                  tileColor: Colors.white,

                  title: Text("About Us",style: TextStyle(fontSize: 20),),


                  trailing: Icon(Icons.arrow_forward_ios)
              ),
            ),

            SizedBox(height: 1,),
            GestureDetector(onTap: (){FirebaseAuth.instance.signOut();
            },
              child: ListTile(
                  tileColor: Colors.white,

                  title: Text("LogOut",style: TextStyle(fontSize: 20),),


                  trailing: Icon(Icons.arrow_forward_ios)
              ),
            ),

            SizedBox(height: 3.5,),




          ],



        ],
      ),

    );
  }
}