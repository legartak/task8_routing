import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8_routing/controllers/theme_cubit.dart';
import 'package:task8_routing/widgets/pet_shop_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage("images/pets.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(
              'App Menu',
              style: TextStyle(
                color: Colors.pink,
                fontSize: 12,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.store),
            iconColor: Colors.black,
            title: const Text(
              "Pet Shop",
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PetShopPage(),
                ),
              );
            },
          ),
          BlocBuilder<ThemeCubit, bool>(
            builder: (BuildContext context, themeState) => ListTile(
              leading: Icon(themeState ? Icons.light_mode : Icons.dark_mode),
              iconColor: Colors.black,
              title: Text(
                themeState ? "Turn on light theme" : "Turn on dark theme",
              ),
              onTap: () {
                context.read<ThemeCubit>().toggleTheme();
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            iconColor: Colors.black,
            title: const Text('About this App'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
    );
  }
}
