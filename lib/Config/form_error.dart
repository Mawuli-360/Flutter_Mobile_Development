// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FormError extends StatelessWidget {
  FormError({Key? key, required this.errors}) : super(key: key);
  List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formError(error: errors[index])),
    );
  }

  Row formError({required String error}) => Row(
        children: [
          Icon(
            Icons.error_outline,
            size: 2.h,
            color: Colors.red,
          ),
          SizedBox(
            width: 1.w,
          ),
          Text(error),
        ],
      );
}
