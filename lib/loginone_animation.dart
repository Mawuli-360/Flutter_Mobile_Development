// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:logindesign/Screens/SignPage/sign_page.dart';
import 'Config/validation_mixin.dart';
import 'package:sizer/sizer.dart';

class Login extends StatelessWidget with ValidationMixin {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF5C152),
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Center(
                child: Text(
              "Register",
              style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            )),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SignPage(),
    );
  }
}


