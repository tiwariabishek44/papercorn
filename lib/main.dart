import 'package:flutter/material.dart';
import 'package:pleez/home_screen/dashboard.dart';

import 'package:flutter/material.dart';
import 'package:pleez/home_screen/detail_screen.dart';
import 'package:pleez/home_screen/home.dart';
import 'package:pleez/providers/user_detail_provider.dart';
import 'package:pleez/screen/sign_in.dart';
import 'home_screen/intro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pleez/utils/color_themes.dart';

import 'layout/screen_layout.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(Papercorner());
}

class Papercorner extends StatelessWidget {
  const Papercorner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_)=>UserDetailsProvider())],
      child: MaterialApp(
        title: "PaperCorner",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, AsyncSnapshot<User?> user) {
              if (user.connectionState == ConnectionState.waiting) {



                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                );
              } else if (user.hasData) {

                return const ScreenLayout();
                //return const SellScreen();
              } else {
                return const SignInScreen();
              }
            }),
      ),
    );
  }
}