import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'keys.dart';

class KeyboardRows extends StatelessWidget {
  KeyboardRows({Key? key, required this.onTap}) : super(key: key);
  final Function(String) onTap;

  final List<String> firstRow = [
    'Q',
    'W',
    'E',
    'R',
    'T',
    'Y',
    'U',
    'I',
    'O',
    'P'
  ];
  final List<String> secondRow = ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'];
  final List<String> thirdRow = ['Z', 'X', 'C', 'V', 'B', 'N', 'M'];



  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: firstRow
              .map((e) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.sp),
            child: Keys(keyName: e, onTap: onTap),
          ))
              .toList(),
        ),
        SizedBox(height: 50.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: secondRow
              .map((e) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.sp),
            child: Keys(keyName: e, onTap: onTap),
          ))
              .toList(),
        ),
        SizedBox(height: 50.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: thirdRow
              .map((e) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.sp),
            child: Keys(keyName: e, onTap: onTap),
          ))
              .toList(),
        ),
      ],
    );
  }
}

