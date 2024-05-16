import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_anwendungen/lang/locale_keys.g.dart';
import 'package:mobile_anwendungen/screens/ListHabits.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(bottomNavigationBar: _menu(theme), body: _tabBarView()),
    );
  }

  Widget _menu(ThemeData theme) {
    return TabBar(
      labelColor: theme.colorScheme.primary,
      unselectedLabelColor: theme.colorScheme.onSurface,
      indicatorColor: theme.colorScheme.primary,
      tabs: [
        Tab(
          icon: const Icon(Icons.list),
          text: LocaleKeys.listHabitsTitle.tr(),
        ),
        const Tab(
          icon: Icon(Icons.show_chart),
          text: "Statistik",
        ),
      ],
    );
  }

  Widget _tabBarView() {
    return const TabBarView(
      children: [Center(child: ListHabits()), Center(child: Text("Statistik"))],
    );
  }
}
