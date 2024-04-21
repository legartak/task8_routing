import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8_routing/controllers/app_event.dart';
import 'package:task8_routing/controllers/app_state.dart';
import 'package:task8_routing/widgets/balance.dart';
import 'package:task8_routing/widgets/casino_results.dart';

import '../controllers/app_bloc.dart';

class CasinoWidget extends StatefulWidget {
  const CasinoWidget({super.key});

  @override
  State<StatefulWidget> createState() => _CasinoWidgetState();
}

class _CasinoWidgetState extends State<CasinoWidget> {
  int _bidSizeValue = 0;

  @override
  Widget build(BuildContext context) {
    return
      // Scaffold(
      // appBar: AppBar(
      //   title: const Text('Gamble your balance'),
      // ),
      // body: Center(
      //   child:
        Column(
          children: [
            AppBar(
              title: const Text('Gamble your balance'),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Try your luck: place a bid and with 50% chance you can double it!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 24,
            ),
            const BalanceWidget(),
            BlocBuilder<AppBloc, AppState>(
              builder: (BuildContext context, state) => state.coins == 0
                  ? const Text(
                      "You need to earn coins first",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                    )
                  : Column(
                      children: [
                        const Text("Choose your bid size:"),
                        Slider(
                          value: _bidSizeValue.toDouble(),
                          min: 0,
                          max: state.coins.toDouble(),
                          divisions: state.coins,
                          label: _bidSizeValue.toString(),
                          onChanged: (double value) {
                            setState(() {
                              _bidSizeValue = value.round();
                            });
                          },
                        ),
                        GestureDetector(
                          onTap: () async {
                            int bid = _bidSizeValue;
                            _bidSizeValue = 0;
                            context.read<AppBloc>().add(PlaceBidEvent(bid));

                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CasinoResultsWidget(bid: bid),
                              ),
                            );

                            if (result != 0) {
                              context
                                  .read<AppBloc>()
                                  .add(GetWinningsEvent(result));
                            }
                          },
                          child: const SizedBox(
                            height: 50,
                            width: 150,
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: Colors.purple),
                              child: Center(
                                child: Text(
                                  "Try your luck",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            const SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const SizedBox(
                height: 50,
                width: 150,
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.purple),
                  child: Center(
                    child: Text(
                      "Exit from here",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        );
    // ,
    //   ),
    // );
  }
}
