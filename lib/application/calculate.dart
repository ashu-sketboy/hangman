import 'package:flutter/material.dart';

class Calculate {
  final String _word;
  final List<String?> guessedWord;
  bool? loose, win;
  
  int availableLife = 6;

  Calculate({required String word}) : _word = word, guessedWord = List.generate(word.length, (index) => '');

  void guessWord(Characters letter) {
    bool letterMatched = false;

    for(int i = 0; i<_word.length; i++) {
      if(_word.characters.characterAt(i) == letter) {
        letterMatched = true;
        guessedWord[i] = letter.toString();
      }
    }

    if(!letterMatched) {
      availableLife--;
    }
    print('== life: $availableLife');

    if(guessedWord.join() == _word) {
      win = true;
    } else if(guessedWord.join() != _word && availableLife == 0) {
      loose = true;
    }
  }

  String get word => _word;
}