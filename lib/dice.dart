import 'dart:math';
import 'package:flutter/material.dart';

class Dice {
  int value;
  bool isHeld;

  Dice({int? value, this.isHeld = false}) : value = value ?? Random().nextInt(6) + 1;

  void roll() {
    if (!isHeld) {
      value = Random().nextInt(6) + 1;
    }
  }

  void toggleHold() {
    isHeld = !isHeld;
  }

  bool get isHeldState => isHeld;
}

void rollDice(List<Dice> dice) {
  for (var die in dice) {
    die.roll();
  }
}

Widget dot() {
  return Container(
    height: 10,
    width: 10,
    decoration: BoxDecoration(
      color: Colors.black,
      shape: BoxShape.circle,
    ),
  );
}

Widget buildDie(int value) {
  List<Widget> dots = [];
  switch (value) {
    case 1:
      dots = [Positioned(left: 45, top: 40, child: dot())];
      break;
    case 2:
      dots = [
        Positioned(left: 15, top: 10, child: dot()),
        Positioned(left: 75, top: 70, child: dot())
      ];
      break;
    case 3:
      dots = [
        Positioned(left: 15, top: 10, child: dot()),
        Positioned(left: 45, top: 40, child: dot()),
        Positioned(left: 75, top: 70, child: dot())
      ];
      break;
    case 4:
      dots = [
        Positioned(left: 15, top: 10, child: dot()),
        Positioned(left: 75, top: 10, child: dot()),
        Positioned(left: 15, top: 70, child: dot()),
        Positioned(left: 75, top: 70, child: dot())
      ];
      break;
    case 5:
      dots = [
        Positioned(left: 15, top: 10, child: dot()),
        Positioned(left: 75, top: 10, child: dot()),
        Positioned(left: 45, top: 40, child: dot()),
        Positioned(left: 15, top: 70, child: dot()),
        Positioned(left: 75, top: 70, child: dot())
      ];
      break;
    case 6:
      dots = [
        Positioned(left: 15, top: 10, child: dot()),
        Positioned(left: 75, top: 10, child: dot()),
        Positioned(left: 15, top: 40, child: dot()),
        Positioned(left: 75, top: 40, child: dot()),
        Positioned(left: 15, top: 70, child: dot()),
        Positioned(left: 75, top: 70, child: dot())
      ];
      break;
  }
  return Container(
    decoration: BoxDecoration(
      border: Border.all(width: 1),
    ),
    height: 100,
    width: 100,
    child: Stack(children: dots),
  );
}