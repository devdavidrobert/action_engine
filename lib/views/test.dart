import 'package:action_engine/views/call_list.dart';
import 'package:action_engine/views/dashboard.dart';
// import 'package:action_engine/views/call_list_page.dart';
import 'package:action_engine/views/follow_ups_page.dart';
import 'package:action_engine/views/home_page.dart';
import 'package:action_engine/views/test_table.dart';
// import 'package:action_engine/views/follow_ups_view.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          // Create a navigation rail
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            backgroundColor: Colors.green,
            destinations: const <NavigationRailDestination>[
              // Navigation destinations
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('Wishlist'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person_outline_rounded),
                selectedIcon: Icon(Icons.person),
                label: Text('Account'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.shopping_cart_outlined),
                selectedIcon: Icon(Icons.shopping_cart),
                label: Text('Cart'),
              ),
            ],
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.black),
            selectedLabelTextStyle: const TextStyle(color: Colors.white),
          ),
          const VerticalDivider(thickness: 1, width: 2),
          Expanded(
            child: Center(
              child: _selectedIndex == 0
                  ? const DashboardPage()
                  : _selectedIndex == 1
                      ? const CallListPage()
                      : const HomeView(),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: TestPage(),
  ));
}
