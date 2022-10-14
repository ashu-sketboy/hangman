import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Letters extends StatelessWidget {
  const Letters({Key? key, this.letter = ' '}) : super(key: key);

  final String letter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.sp,
      width: 40.sp,
      child: Column(
        children: [
          Text(letter, style: TextStyle(fontSize: 18.sp, color: const Color(0xff051937), fontWeight: FontWeight.bold),),
          ClipRRect(
              borderRadius: BorderRadius.circular(10.sp),
              child: Divider(color: const Color(0xff051937),height: 5.sp, thickness: 4.sp,)),
        ],
      ),
    );
  }
}