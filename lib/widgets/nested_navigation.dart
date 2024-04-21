import 'package:flutter/material.dart';

import 'casino.dart';

class OtherMenusNavigator extends StatefulWidget {
  const OtherMenusNavigator({super.key});

  @override
  _OtherMenusNavigatorState createState() => _OtherMenusNavigatorState();
}


class _OtherMenusNavigatorState extends State<OtherMenusNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            if (settings.name == '/') {
              return const SectionsMenu();
            } else if (settings.name == '/gambling') {
              return const CasinoWidget();
            } else {
              throw Exception();
            }
          },
        );
      },
    );
  }
}

class SectionsMenu extends StatelessWidget {
  const SectionsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBar(
          title: const Text("Sections Menu"),
        ),
        ListTile(
          leading: const Icon(Icons.casino),
          iconColor: Colors.black,
          title: const Text(
            "Go to Gamble balance",
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CasinoWidget(),
              ),
            );
          },
        ),
      ],
    );
  }
}