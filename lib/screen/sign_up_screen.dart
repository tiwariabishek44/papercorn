import 'dart:developer';
import 'package:pleez/resources/authentication_method.dart';
import 'package:pleez/screen/sign_in.dart';
import 'package:pleez/utils/color_themes.dart';
import 'package:pleez/utils/constant.dart';
import 'package:pleez/utils/utils.dart';
import 'package:pleez/widget/costum_mainbutton.dart';
import 'package:pleez/widget/text_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phonenoController = TextEditingController();

  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthenticationMethods authenticationMethods = AuthenticationMethods();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phonenoController.dispose();
    addressController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 Text('PaperCorn',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  SizedBox(
                    height: screenSize.height * 0.88,
                    child: FittedBox(
                      child: Container(
                        height: screenSize.height * 0.75,
                        width: screenSize.width * 0.9,
                        padding: const EdgeInsets.all(25),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Sign-Up",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 22),
                            ),
                            Expanded(
                              child: TextFieldWidget(
                                title: "Name",
                                controller: nameController,
                                obscureText: false,
                                hintText: "Enter your name",
                              ),
                            ),
                            Expanded(
                              child: TextFieldWidget(
                                title: "Address",
                                controller: addressController,
                                obscureText: false,
                                hintText: "Enter your address",
                              ),
                            ),
                            Expanded(
                              child: TextFieldWidget(
                                title: "Phone NO",
                                controller: phonenoController,
                                obscureText: false,
                                hintText: "Enter your phone.no",
                              ),
                            ),
                            Expanded(
                              child: TextFieldWidget(
                                title: "Email",
                                controller: emailController,
                                obscureText: false,
                                hintText: "Enter your email",
                              ),
                            ),
                            Expanded(
                              child: TextFieldWidget(
                                title: "Password",
                                controller: passwordController,
                                obscureText: true,
                                hintText: "Enter your password",
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: CustomMainButton(
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(fontSize: 17,
                                      letterSpacing: 0.6, color: Colors.black),
                                ),
                                color: yellowColor,
                                isLoading: isLoading,
                                onPressed: () async {
                                  setState(() {
                                  isLoading = true;
                                  });
                                  String output =
                                  await authenticationMethods.signUpUser(
                                  name: nameController.text,
                                  address: addressController.text,
                                  phoneno: phonenoController.text,
                                  email: emailController.text,
                                  password: passwordController.text);

                                  setState(() {
                                  isLoading = false;
                                  });
                                  if (output == "success") {
                                  Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                  builder: (_) =>
                                             const SignInScreen()));
                                  } else {
                                    //error
                                    Utils().showSnackBar(
                                        context: context, content: output);
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomMainButton(
                        child: const Text(
                          "Back",
                          style: TextStyle(fontSize: 15,
                            letterSpacing: 0.6,
                            color: Colors.black,
                          ),
                        ),
                        color: Colors.grey[400]!,
                        isLoading: false,
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                                return const SignInScreen();
                              }));
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}