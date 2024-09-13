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
            onPressed: () {
              setState(() {
                rollDice(dice);
              });
            },
            child: Text("Roll"),
          ),
        ],
      ),
    );
  }
}