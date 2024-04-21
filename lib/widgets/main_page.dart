import 'package:flutter/material.dart';
import 'package:task8_routing/widgets/balance.dart';
import 'intro_and_button.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        AppBar(
          title: const Text("PetClicker Home Page"),
        ),
        const Intro(),
        const Center(
          child: BalanceWidget(),
        ),
      ],
    );
  }
}
