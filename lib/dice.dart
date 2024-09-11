import 'dart:math';

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