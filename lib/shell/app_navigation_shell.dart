import 'package:flutter/material.dart';

import '../screens/insights_screen.dart';
import '../theme/app_theme.dart';

/// Root shell with bottom navigation: Detect · Insights.
class AppNavigationShell extends StatefulWidget {
  const AppNavigationShell({
    super.key,
    required this.detectTab,
  });

  /// Main capture / prediction flow (provided by [main.dart] to avoid circular imports).
  final Widget detectTab;

  @override
  State<AppNavigationShell> createState() => _AppNavigationShellState();
}

class _AppNavigationShellState extends State<AppNavigationShell> {
  int _index = 0;

  static const _tabs = <_NavTab>[
    _NavTab(
      label: 'Detect',
      icon: Icons.camera_alt_outlined,
      selectedIcon: Icons.camera_alt_rounded,
    ),
    _NavTab(
      label: 'Insights',
      icon: Icons.auto_graph_outlined,
      selectedIcon: Icons.auto_graph_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: [
          widget.detectTab,
          const InsightsScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        backgroundColor: AppColors.surface,
        indicatorColor: AppColors.primarySoft,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: [
          for (final tab in _tabs)
            NavigationDestination(
              icon: Icon(tab.icon),
              selectedIcon: Icon(tab.selectedIcon, color: AppColors.primary),
              label: tab.label,
            ),
        ],
      ),
    );
  }
}

class _NavTab {
  const _NavTab({
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
}
