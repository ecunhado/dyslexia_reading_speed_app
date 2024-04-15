import 'package:flutter/material.dart';
import 'package:word_counter/digit.dart';
import 'package:flutter/cupertino.dart';

typedef IntCallback = void Function(int val);

class NumPad extends StatelessWidget {
  int words;
  final IntCallback callback;

  NumPad({super.key, required this.words, required this.callback});

  void handleDeleteAllPress() {
    words = 0;
    callback(words);
  }

  void handleDeletePress() {
    words = words ~/ 10;
    callback(words);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Digit(digit: '1', words: words, number: 1, callback: callback),
          Digit(digit: '2', words: words, number: 2, callback: callback),
          Digit(digit: '3', words: words, number: 3, callback: callback),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Digit(digit: '4', words: words, number: 4, callback: callback),
          Digit(digit: '5', words: words, number: 5, callback: callback),
          Digit(digit: '6', words: words, number: 6, callback: callback),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Digit(digit: '7', words: words, number: 7, callback: callback),
          Digit(digit: '8', words: words, number: 8, callback: callback),
          Digit(digit: '9', words: words, number: 9, callback: callback),
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          SizedBox(
            height: 36,
            width: 36,
            child: CupertinoButton(
              // padding on cupertino button defaults to 16, that's why we set it to 0
              padding: const EdgeInsets.all(0),
              onPressed: () {
                handleDeleteAllPress();
              },
              child: Container(
                padding: const EdgeInsets.all(6.0),
                margin: const EdgeInsets.all(2.0),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 15.0,
                ),
              ),
            ),
          ),
          Digit(digit: '0', words: words, number: 0, callback: callback),
          SizedBox(
            height: 36,
            width: 36,
            child: CupertinoButton(
              // padding on cupertino button defaults to 16, that's why we set it to 0
              padding: const EdgeInsets.all(0),
              onPressed: () {
                handleDeletePress();
              },
              child: Container(
                padding: const EdgeInsets.all(6.0),
                margin: const EdgeInsets.all(2.0),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: const Icon(
                  IconData(
                    0xe09d,
                    fontFamily: 'MaterialIcons',
                    matchTextDirection: true,
                  ),
                  color: Colors.black,
                  size: 19.0,
                ),
              ),
            ),
            // child: Container(
            //   padding: const EdgeInsets.all(6.0),
            //   margin: const EdgeInsets.all(2.0),
            //   decoration: BoxDecoration(
            //     border: Border.all(color: Colors.black),
            //     borderRadius: BorderRadius.circular(5.0),
            //   ),
            //   child: const Icon(
            //     IconData(
            //       0xe09d,
            //       fontFamily: 'MaterialIcons',
            //       matchTextDirection: true,
            //     ),
            //     size: 30.0,
            //   ),
            // ),
          ),
        ]),
      ],
    );
  }
}

