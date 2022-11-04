// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../Config/validation_mixin.dart';

class InputField extends StatefulWidget with ValidationMixin {
  late String label;
  bool obscureText = false;
  InputField({required this.label, required this.obscureText, super.key});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> with ValidationMixin {
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
  Widget build(BuildContext context) {
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
          obscureText: widget.obscureText,
          obscuringCharacter: "*",
          cursorColor: Colors.black,
          decoration: InputDecoration(
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 20),
              hintText: widget.label,
              fillColor: Color.fromARGB(255, 219, 213, 213),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none),
        ),
      ),
    );
  }
}
