import 'package:flutter/material.dart';
import 'package:hangman/application/calculate.dart';
import 'package:hangman/networking/networking.dart';
import 'package:hangman/presentation/screens/result_screen.dart';
import 'package:hangman/presentation/widgets/letters.dart';
import 'package:sizer/sizer.dart';

import '../widgets/keyboard_rows.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff051937),
              Color(0xffa8eb12),
            ],
            begin: Alignment(-1, -1),
            end: Alignment(1, 1),
          ),
        ),
        child: FutureBuilder<String?>(
          future: Networking.fetchData(),
          builder: (context, snapshot) {
            if(snapshot.hasData && snapshot.data != null) {
              return SafeArea(
                child: Game(word: snapshot.data!)
              );
            } else if(snapshot.hasData && snapshot.data == null) {
              return const Center(
                child: Text(
                  'SOMETHING WENT WRONG\n TRY TO RESTART AGAIN'
                ),
              );
            } else if(snapshot.hasError) {
              return Center(
                child: Text(
                    snapshot.error.toString()
                ),
              );
            }
            else {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xff051937)),
              );
            }

          }
        ),
      ),
    );
  }
}

class Game extends StatefulWidget {
  const Game({Key? key, required this.word}) : super(key: key);

  final String word;

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  late final Calculate calculate;

  void onTap(String val) {
    setState(() => calculate.guessWord(val.characters));

    if(calculate.win != null && calculate.win!) {
      showDialog(context: context, builder: (context) => ResultScreen(loose: false, word: calculate.word,),);
    } else if(calculate.loose != null && calculate.loose!) {
      showDialog(context: context, builder: (context) => ResultScreen(loose: true, word: calculate.word,),);
    }

  }

  @override
  void initState() {
    super.initState();
    calculate = Calculate(word: widget.word);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/hang_${6 - calculate.availableLife}.png',height: 80.w, width: 50.w),
        const Spacer(),
        Wrap(
            spacing: 5.sp,
            children: calculate.guessedWord.map((e) => e == null ? SizedBox(width: 30.sp) : Letters(letter: e,),).toList()
        ),
        const Spacer(),
        KeyboardRows(onTap: onTap),
        SizedBox(height: 40.sp),
      ],
    );
  }
}





