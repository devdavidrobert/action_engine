import 'package:action_engine/constants/app_fonts.dart';
import 'package:action_engine/widgets/widget_separator.dart';
import 'package:flutter/material.dart';

class testPage_ extends StatefulWidget {
  const testPage_({super.key});

  @override
  State<testPage_> createState() => _testPage_State();
}

class _testPage_State extends State<testPage_> {
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
                          onTap: () {},
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Good Afternoon,',
                        style: AppFonts.montserratBoldHeader,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'David Robert',
                        style: AppFonts.montserratBold,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 1.0,
                    child: Container(
                      color: Colors.grey,
                    ),
                  ),
                  const WidgetSeparator(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 50.0,
                          child: ClipRRect(
                            child: Center(
                                child: Text(
                              '500',
                              style: AppFonts.montserratBoldHeader,
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                          child: ClipRRect(
                            child: Center(
                                child: Text(
                              '500',
                              style: AppFonts.montserratBoldHeader,
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                          child: ClipRRect(
                            child: Center(
                                child: Text(
                              '500',
                              style: AppFonts.montserratBoldHeader,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Table(
                      border: TableBorder.all(),
                      children: const [
                        TableRow(children: [
                          TableCell(
                            child: Center(
                              child: Text('Customer ID'),
                            ),
                          ),
                          TableCell(
                            child: Center(
                              child: Text('Customer ID'),
                            ),
                          ),
                          TableCell(
                            child: Center(
                              child: Text('Customer ID'),
                            ),
                          ),
                          TableCell(
                            child: Center(
                              child: Text('Customer ID'),
                            ),
                          ),
                          TableCell(
                            child: Center(
                              child: Text('Customer ID'),
                            ),
                          ),
                          TableCell(
                            child: Center(
                              child: Text('Customer ID'),
                            ),
                          ),
                          TableCell(
                            child: Center(
                              child: Text('Customer ID'),
                            ),
                          ),
                        ])
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: testPage_(),
  ));
}
