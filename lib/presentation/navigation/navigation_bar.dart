import 'package:doctorum/presentation/screens/account_screen.dart';
import 'package:doctorum/presentation/screens/home_screen.dart';
import 'package:doctorum/presentation/screens/notes_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:doctorum/resource/langs/locale_keys.g.dart';

class NavigationBottomBar extends StatefulWidget {
  const NavigationBottomBar({super.key});

  @override
  State<NavigationBottomBar> createState() => _NavigationBottomBarState();
}

class _NavigationBottomBarState extends State<NavigationBottomBar> {
  int _currentPageIndex = 0;
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: labelBehavior,
        selectedIndex: _currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: const Icon(Icons.home),
            icon: const Icon(Icons.home_outlined),
            label: LocaleKeys.homeTitle.tr(),
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.calendar_month),
            icon: const Icon(Icons.calendar_month_outlined),
            label: LocaleKeys.notesTitle.tr(),
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.account_circle),
            icon: const Icon(Icons.account_circle_outlined),
            label: LocaleKeys.accountTitle.tr(),
          ),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _currentPageIndex,
          children: [
            HomeScreen(key: UniqueKey()),
            NotesScreen(key: UniqueKey()),
            AccountScreen(key: UniqueKey()), // планирование
          ],
        ),
      ),
    );
  }
}