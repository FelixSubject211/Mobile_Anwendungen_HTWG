import 'package:flutter/material.dart';
import 'package:mobile_anwendungen/screens/ListHabits.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: _menu(theme),
        body: _tabBarView()
      ),
    );
  }

  Widget _menu(ThemeData theme) {
    return TabBar(
      labelColor: theme.colorScheme.primary,
      unselectedLabelColor: theme.colorScheme.onSurface,
      indicatorColor: theme.colorScheme.primary,
      tabs: const [
        Tab(
          icon: Icon(Icons.settings),
          text: "Einstellungen",
        ),
        Tab(
          icon: Icon(Icons.list),
          text: "Gewohnheiten",
        ),
        Tab(
          icon: Icon(Icons.show_chart),
          text: "Statistik",
        ),
      ],
    );
  }

  Widget _tabBarView() {
    return const TabBarView(
      children: [
        Center(child: Text("Einstellungen")),
        Center(child: ListHabits()),
        Center(child: Text("Statistik")),
      ],
    );
  }
}
