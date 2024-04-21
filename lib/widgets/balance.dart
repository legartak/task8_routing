import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';import '../controllers/app_bloc.dart';
import '../controllers/app_state.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) => Text(
        "Your balance is ${state.coins} coins!",
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
