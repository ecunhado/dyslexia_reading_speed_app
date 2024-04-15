import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

typedef IntCallback = void Function(int val);

class Digit extends StatelessWidget {
  late String digit;
  int words;
  int number;
  final IntCallback callback;

  Digit(
      {super.key,
      required this.digit,
      required this.words,
      required this.number,
      required this.callback});

  void handleDigitPress() {
    if (words > 100000) {
      return;
    }
    words = words * 10 + number;
    callback(words);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      width: 36,
      child: CupertinoButton(
        // padding on cupertino button defaults to 16, that's why we set it to 0
        padding: const EdgeInsets.all(0),
        onPressed: () {
          handleDigitPress();
        },
        child: Container(
          padding: const EdgeInsets.all(6.0),
          margin: const EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Center(
            child: Text(
              digit,
              style:
                  DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1),
            ),
          ),
        ),
      ),
    );
  }
}

