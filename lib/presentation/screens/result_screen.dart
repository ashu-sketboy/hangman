import 'package:flutter/material.dart';
import 'package:hangman/presentation/screens/game_screen.dart';
import 'package:sizer/sizer.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, required this.loose, required this.word}) : super(key: key);

  final bool loose;
  final String word;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 80.w,
          height: 200.sp,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xff051937),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                loose ? 'HANGED' : 'SAVED',
                style: TextStyle(
                  color: const Color.fromARGB(255, 250, 249, 248),
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

                const Spacer(),
                Text(
                  '${word.toUpperCase()} IS THE WORD',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 250, 249, 248),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),


              const Spacer(),
              IconButton(onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const GameScreen()));
              }, icon: Icon(Icons.refresh_outlined, color: const Color(0xffa8eb12), size: 30.sp)),
              const Spacer(),
            ],
          )
        ),
      ),
    );
  }
}
