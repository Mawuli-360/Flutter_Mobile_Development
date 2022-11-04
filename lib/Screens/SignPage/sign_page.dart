// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logindesign/Config/constants.dart';
import 'package:logindesign/Config/form_error.dart';
import 'package:logindesign/Widgets/social_links.dart';
import 'package:sizer/sizer.dart';

import '../../Config/validation_mixin.dart';
import '../WelcomePage/welcome_page.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage>
    with SingleTickerProviderStateMixin, ValidationMixin {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late AnimationController animationController;
  List<String> errors = [];
  final kEmailError = "Please email invalid";
  final kPassError = "Please passowrd must be at least 8 characters";
  GlobalKey<FormState> loginkey = GlobalKey<FormState>();

  String addError(String error) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
    return "";
  }

  void removeError(String error) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    Timer(Duration(seconds: 1), (() => const Duration(seconds: 2)));
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.h),
              child: SlideTransition(
                 position: Tween<Offset>(
                        begin: Offset(-1, 0),
                        end: Offset.zero,).animate(animationController),
                child: FadeTransition(
                  opacity: animationController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 28.sp,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Text(
                        "Welcome to Best Shop in the world \nGet whatever you want here",
                        style: TextStyle(fontSize: 12.sp, fontFamily: "Lato"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SlideTransition(
              position:Tween<Offset>(
                        begin: Offset(-1, 0),
                        end: Offset.zero,).animate(animationController),
              child: FadeTransition(
                opacity: animationController,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: boxShadow,
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Form(
                    key: loginkey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.h),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 6.h,
                          ),
                          emailInput(context: context, label: "Username"),
                          SizedBox(height: 2.h),
                          passwordInput(
                              context: context,
                              label: "Password",
                              obscureText: true),
                          SizedBox(
                            height: 3.h,
                          ),
                          Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(fontSize: 16),
                              )),
                          SizedBox(
                            height: 6.h,
                            child: FormError(errors: errors),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (loginkey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            WelcomePage())));
                              }
                            },
                            child: Container(
                              height: 7.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                              child: Center(
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          socialLink(
                            icon: Icons.mail_outline,
                            label: 'Continue with Google',
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          socialLink(
                            icon: Icons.facebook_outlined,
                            label: 'Continue with Facebook',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget emailInput(
      {required BuildContext context,
      required String label,
      obscureText = false}) {
    return Container(
      height: 7.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(28)),
        color: Color.fromARGB(113, 231, 231, 231),
      ),
      child: Center(
        child: TextFormField(
          onChanged: (value) {
            if (isEmailValid(value)) {
              removeError(kEmailError);
            }
          },
          validator: (email) {
            return isEmailValid(email!) ? null : addError(kEmailError);
          },
          obscureText: obscureText,
          obscuringCharacter: "*",
          cursorColor: Colors.black,
          decoration: InputDecoration(
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 20),
              hintText: label,
              fillColor: Color.fromARGB(255, 219, 213, 213),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none),
        ),
      ),
    );
  }

  Widget passwordInput(
      {required BuildContext context,
      required String label,
      obscureText = false}) {
    return Container(
      height: 7.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(28)),
        color: Color.fromARGB(113, 231, 231, 231),
      ),
      child: Center(
        child: TextFormField(
          onChanged: (value) {
            if (isPasswordValid(value)) {
              removeError(kPassError);
            }
          },
          validator: (password) {
            return isPasswordValid(password!) ? null : addError(kPassError);
          },
          obscureText: obscureText,
          obscuringCharacter: "*",
          cursorColor: Colors.black,
          decoration: InputDecoration(
              focusedErrorBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 20),
              hintText: label,
              fillColor: Color.fromARGB(255, 219, 213, 213),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none),
        ),
      ),
    );
  }
}
