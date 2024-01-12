import 'package:flutter/material.dart';
import 'package:photo/features/auth/presentation/pages/login_page.dart';
import 'package:photo/features/auth/presentation/pages/register_page.dart';
import 'package:photo/features/main/presentation/pages/home/home_page.dart';

import '../../../auth/presentation/pages/main_screen.dart';
import '../../../auth/presentation/pages/register_policy.dart';

class BottomWidget extends StatefulWidget {
  const BottomWidget({Key? key}) : super(key: key);

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  int _currentIndex = 0;
  final screens = [
    LoggedOutScreen(),
    const RegisterPage(),
    const RegistrePolicy(),
    const LoginPage(),
    const DiscoverPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        body: IndexedStack(
          index: _currentIndex,
          children: screens,
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: BottomNavigationBar(
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.grey,
              currentIndex: _currentIndex,
              onTap: (int newIndex) {
                setState(() {
                  _currentIndex = newIndex;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  label: "fdhfh",
                  icon: Icon(Icons.abc),
                ),
                BottomNavigationBarItem(
                  label: "fdhfh",
                  icon: Icon(Icons.abc),
                ),
                BottomNavigationBarItem(
                  label: "hreh",
                  icon: Icon(Icons.abc),
                ),
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(Icons.abc),
                ),
                BottomNavigationBarItem(
                  label: "Home",
                  icon: Icon(Icons.abc),
                ),
              ]),
        ));
  }
}
