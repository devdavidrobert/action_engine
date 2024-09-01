import 'package:action_engine/constants/app_fonts.dart';
import 'package:action_engine/widgets/widget_separator.dart';
import 'package:flutter/material.dart';

class testPage extends StatefulWidget {
  const testPage({super.key});

  @override
  State<testPage> createState() => _testPageState();
}

class _testPageState extends State<testPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 200,
            child: Container(
              color: Colors.grey.shade100,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Action Engine',
                          style: AppFonts.montserratBoldHeader,
                        ),
                        const WidgetSeparator(),
                        const WidgetSeparator(),
                        const WidgetSeparator(),
                        const WidgetSeparator(),
                        const WidgetSeparator(),
                        const WidgetSeparator(),
                        Material(
                          child: ListTile(
                            title: const Text(
                              'Dashboard',
                            ),
                            titleTextStyle: AppFonts.montserratBold,
                          ),
                        ),
                        const WidgetSeparator(),
                        Material(
                          child: ListTile(
                            title: const Text(
                              'Call List',
                            ),
                            titleTextStyle: AppFonts.montserratBold,
                          ),
                        ),
                        const WidgetSeparator(),
                        Material(
                          child: ListTile(
                            title: const Text(
                              'Follow-up',
                            ),
                            titleTextStyle: AppFonts.montserratBold,
                          ),
                        ),
                        const WidgetSeparator(),
                        Material(
                          child: ListTile(
                            title: const Text(
                              'Ureachable',
                            ),
                            titleTextStyle: AppFonts.montserratBold,
                          ),
                        ),
                        const WidgetSeparator(),
                        Material(
                          child: ListTile(
                            title: const Text(
                              'Promised to Pay',
                            ),
                            titleTextStyle: AppFonts.montserratBold,
                          ),
                        ),
                        const WidgetSeparator(),
                        Material(
                          child: ListTile(
                            title: const Text(
                              'Earning and Perfomance',
                            ),
                            titleTextStyle: AppFonts.montserratBold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ListTile(
                          title: const Text(
                            'Settings',
                          ),
                          titleTextStyle: AppFonts.montserratRegular,
                        ),
                        ListTile(
                          title: const Text(
                            'Logout',
                          ),
                          titleTextStyle: AppFonts.montserratRegular,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Column 2',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('Item A'),
                Text('Item B'),
                Text('Item C'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: testPage(),
  ));
}
