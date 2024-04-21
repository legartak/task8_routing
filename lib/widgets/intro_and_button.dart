import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task8_routing/controllers/app_event.dart';

import '../controllers/app_bloc.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Welcome to updated version of PetClicker! Now it includes variations of routing.',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: const SizedBox(
              height: 150,
              width: 150,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.blueAccent),
                child: Center(
                  child: Text(
                    "Click me!",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ),
          onTap: () {
            context.read<AppBloc>().add(AddCoinEvent());
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
