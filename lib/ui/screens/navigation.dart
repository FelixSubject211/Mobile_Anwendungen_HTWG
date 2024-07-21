import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_anwendungen/lang/locale_keys.g.dart';
import 'package:mobile_anwendungen/ui/screens/habits/habits_view.dart';
import 'package:mobile_anwendungen/ui/screens/statistics/statistics_view.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: _navigation(theme),
      ),
      body: _pages()[currentPageIndex],
    );
  }

  List<Widget> _navigation(ThemeData theme) {
    return <Widget>[
      NavigationDestination(
        icon: Icon(
            Icons.list,
            semanticLabel: LocaleKeys.habitsTitle.tr(),
        ),
        label: LocaleKeys.habitsTitle.tr(),
      ),
      NavigationDestination(
        icon: Icon(
            Icons.leaderboard,
            semanticLabel: LocaleKeys.statisticsTitle.tr(),
        ),
        label: LocaleKeys.statisticsTitle.tr(),
      ),
    ];
  }

  List<Widget> _pages() {
    return const <Widget>[
      Center(child: Habits()),
      Center(child: Statistics()),
    ];
  }
}
