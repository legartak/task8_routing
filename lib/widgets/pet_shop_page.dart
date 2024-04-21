import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8_routing/controllers/app_event.dart';
import 'package:task8_routing/controllers/app_state.dart';
import 'package:task8_routing/widgets/balance.dart';

import '../controllers/app_bloc.dart';

class PetShopPage extends StatelessWidget {
  const PetShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pet Shop Page"),
      ),
      body: Center(
        child: Column(
          children: [
            BlocBuilder<AppBloc, AppState>(
              builder: (context, state) => Column(
                children: [
                  const SizedBox(height: 12,),
                  const BalanceWidget(),
                  const SizedBox(height: 24,),
                  Text("Number of your cats is: ${state.cats}"),
                  const Text("1 cat costs 5 coins / Income +1 coins"),
                  GestureDetector(
                    onTap: state.coins >= 5
                        ? () {
                            context.read<AppBloc>().add(BuyCatEvent());
                          }
                        : null,
                    child: SizedBox(
                      height: 50,
                      width: 150,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color:
                                state.coins >= 5 ? Colors.green : Colors.red),
                        child: const Center(
                          child: Text(
                            "Buy a cat",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24,),
                  Text("Number of your dogs is: ${state.dogs}"),
                  const Text("1 dog costs 10 coins / Income +3 coins"),
                  GestureDetector(
                    onTap: state.coins >= 10
                        ? () {
                            context.read<AppBloc>().add(BuyDogEvent());
                          }
                        : null,
                    child: SizedBox(
                      height: 50,
                      width: 150,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                            color:
                                state.coins >= 10 ? Colors.green : Colors.red),
                        child: const Center(
                          child: Text(
                            "Buy a dog",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
