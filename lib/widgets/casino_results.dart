import 'dart:math';

import 'package:flutter/material.dart';

class CasinoResultsWidget extends StatelessWidget {
  CasinoResultsWidget({super.key, required this.bid});

  final int bid;
  final int winOrLoss = Random().nextInt(2);

  @override
  Widget build(BuildContext context) {
    int earnings = winOrLoss == 1 ? (bid * 2) : 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(winOrLoss == 1 ? "Congratulations!" : "Not this time..."),
      ),
      body: Column(
        children: [
          Text(
            winOrLoss == 1
                ? "You've won this time. You got: $earnings coins."
                : "You've lost. But maybe next time you'll win.",
            style: const TextStyle(fontSize: 18),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context, earnings);
              },
              child: const SizedBox(
                height: 50,
                width: 150,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.purple),
                  child: Center(
                    child: Text(
                      "Accept result",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
