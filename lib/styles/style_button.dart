import 'package:pr_mb_task1_1/pages/home_page.dart';
import 'package:flutter/material.dart';

class btnStyle {
   ButtonStyle allBtn = ButtonStyle(
     // backgroundColor: MaterialStateProperty.all(btnColor),
     padding: MaterialStateProperty.all(const EdgeInsets.all(15)),
     shape: MaterialStateProperty.all(RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(20),
     )),
      );
}