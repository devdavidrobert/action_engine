import 'package:action_engine/constants/app_fonts.dart';
import 'package:action_engine/views/call_list.dart';
import 'package:action_engine/views/home_page.dart';
import 'package:action_engine/views/test.dart';
import 'package:flutter/material.dart';

class NavigationBarView extends StatefulWidget {
  const NavigationBarView({super.key});

  @override
  State<NavigationBarView> createState() => _NavigationBarViewState();
}

class _NavigationBarViewState extends State<NavigationBarView> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              leading: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 50),
                child: Text(
                  'Action Engine',
                  style: AppFonts.montserratBoldHeader,
                ),
              ),
              extended: true,
              minExtendedWidth: 200,
              indicatorColor: Colors.blue.shade200,
              backgroundColor: Colors.white70,
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: const Icon(Icons.home),
                  label: Text(
                    'Home',
                    style: AppFonts.montserratBold,
                  ),
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.phone),
                  label: Text(
                    'Call List',
                    style: AppFonts.montserratBold,
                  ),
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.calendar_month),
                  label: Text(
                    'Follow Ups',
                    style: AppFonts.montserratBold,
                  ),
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.dashboard),
                  label: Text(
                    'Reports',
                    style: AppFonts.montserratBold,
                  ),
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.help_center),
                  label: Text(
                    'Information',
                    style: AppFonts.montserratBold,
                  ),
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                ),
              ],
            ),
          ),
          Expanded(
              child: Center(
                  child: _selectedIndex == 0
                      ? const HomeView()
                      : const DataListPage()))
        ],
      ),
    );
  }
}
