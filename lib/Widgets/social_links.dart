// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:logindesign/Config/constants.dart';
import 'package:sizer/sizer.dart';

socialLink({required IconData icon, required String label}) {
  return Container(
    decoration: BoxDecoration(
        boxShadow: socialBoxShadow,
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30))),
    height: 7.h,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Icon(
              icon,
              color: Color(0xFFF5C152),
              size: 4.h,
            ),
            SizedBox(
              width: 2.w,
            ),
            Text(label),
          ],
        ),
        Icon(Icons.arrow_forward)
      ]),
    ),
  );
}
