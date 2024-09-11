import 'package:flutter/material.dart';
import 'dice.dart';

void main() {
  runApp(Yahtzee());
}

class Yahtzee extends StatelessWidget {
  Yahtzee({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "yahtzee",
      home: YahtzeeHome(),
    );
  }
}

class YahtzeeHome extends StatefulWidget {
  @override
  State<YahtzeeHome> createState() => YahtzeeHomeState();
}

class YahtzeeHomeState extends State<YahtzeeHome> {
  List<Dice> dice = List.generate(5, (_) => Dice());

  void rollDice() {
    setState(() {
      for (var die in dice) {
        die.roll();
      }
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("yahtzee")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: dice.map((die) {
              return Column(
                children: [
                  buildDie(die.value),
                  SizedBox(height: 10), // Space between die and hold button
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        die.toggleHold();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: die.isHeldState ? Colors.blue : null,
                      foregroundColor: Colors.black,
                    ),
                    child: Text("Hold"),
                  ),
                ],
              );
            }).toList(),
          ),
          SizedBox(height: 20), // Space between row of dice and roll button
          ElevatedButton(
            onPressed: rollDice,
            child: Text("Roll"),
          ),
        ],
      ),
    );
  }
}