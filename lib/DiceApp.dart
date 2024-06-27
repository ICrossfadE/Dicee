import 'dart:math';

import 'package:flutter/material.dart';

class DiceApp extends StatefulWidget {
  const DiceApp({super.key});

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int firstDice = 1;
  int secondDice = 1;

  int counter = 0;

  void _randomDice() {
    setState(() {
      firstDice = Random().nextInt(6) + 1;
      secondDice = Random().nextInt(6) + 1;
      counter = firstDice + secondDice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white24,
        appBar: AppBar(
          title: const Text('Dicee'),
          backgroundColor: Colors.lightBlue,
        ),
        body: _dices(context),
      ),
    );
  }

  Widget _dices(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            '$counter',
            style: const TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: Center(
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _randomDice();
                      });
                    },
                    style: ButtonStyle(
                      padding:
                          WidgetStateProperty.all(const EdgeInsets.all(16.0)),
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                      splashFactory: NoSplash.splashFactory,
                    ),
                    child: Image.asset('images/dice$firstDice.png'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        _randomDice();
                      });
                    },
                    style: ButtonStyle(
                      padding:
                          WidgetStateProperty.all(const EdgeInsets.all(16.0)),
                      overlayColor: WidgetStateProperty.all(Colors.transparent),
                      splashFactory: NoSplash.splashFactory,
                    ),
                    child: Image.asset('images/dice$secondDice.png'),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
