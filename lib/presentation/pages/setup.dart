import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lipid/presentation/pages/messages.dart';
import 'package:lipid/presentation/pages/search.dart';
import 'package:lipid/presentation/pages/settings.dart';
import 'package:lipid/presentation/theme/design_systems.dart';

import 'home.dart';

class Setup extends StatefulWidget {
  const Setup({
    Key? key,
  }) : super(key: key);

  @override
  State<Setup> createState() => _SetupState();
}

class _SetupState extends State<Setup> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedIconTheme: IconThemeData(color: kPrimaryColorOne),
          unselectedIconTheme: IconThemeData(color: kAltFor),
          currentIndex: _currentIndex,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(label: "home", icon: Icon(Icons.bar_chart)),
            BottomNavigationBarItem(label: "search", icon: Icon(Icons.search)),
            BottomNavigationBarItem(
                label: "messages",
                icon: Icon(CupertinoIcons.chat_bubble_2_fill)),
            BottomNavigationBarItem(
                label: "settings", icon: Icon(Icons.settings)),
          ]),
      body: const [
        Home(),
        Search(),
        Messages(),
        Settings(),
      ].elementAt(_currentIndex),
    );
  }
}
