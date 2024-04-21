import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task8_routing/controllers/theme_cubit.dart';
import 'package:task8_routing/settings/app_themes.dart';
import 'package:task8_routing/widgets/about.dart';
import 'package:task8_routing/widgets/custom_drawer.dart';
import 'package:task8_routing/widgets/nested_navigation.dart';
import 'controllers/app_bloc.dart';
import 'widgets/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create: (_) => AppBloc(),
        ),
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit())
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (BuildContext context, themeState) => MaterialApp(
          title: 'Task 8 Routing',
          theme: themeState
              ? AppThemes.appThemeData[AppTheme.darkTheme]
              : AppThemes.appThemeData[AppTheme.lightTheme],
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            // Starting page
            '/': (context) => const MyHomePage(),
            '/about': (context) => const AboutWidget(),
          },
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.house),
              label: "Main Section",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: "Other sections",
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _selectedIndex,
          children: const <Widget>[
            MainPage(),
            OtherMenusNavigator(),
          ],
        ),
      ),
    );
  }
}
