import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataListPage extends StatefulWidget {
  const DataListPage({super.key});

  @override
  _DataListPageState createState() => _DataListPageState();
}

class _DataListPageState extends State<DataListPage> {
  late Future<List<dynamic>> data;
  List<dynamic> _data = [];
  bool _isAscending = true;
  int _sortColumnIndex = 0;

  @override
  void initState() {
    super.initState();
    data = fetchData();
  }

  Future<List<dynamic>> fetchData() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:5000/get-data'));

    if (response.statusCode == 200) {
      setState(() {
        _data = json.decode(response.body);
      });
      return _data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  void _sort<T>(Comparable<T> Function(dynamic record) getField,
      int columnIndex, bool ascending) {
    _data.sort((a, b) {
      if (!ascending) {
        final dynamic c = a;
        a = b;
        b = c;
      }
      final T aValue = getField(a) as T;
      final T bValue = getField(b) as T;
      return Comparable.compare(aValue as Comparable, bValue as Comparable);
    });

    setState(() {
      _sortColumnIndex = columnIndex;
      _isAscending = ascending;
    });
  }

  // Function to show a dialog with the call script
  void _showCallScript(BuildContext context, dynamic record) {
    String customerAnswered = '';
    String speakingToCustomer = '';
    String happyWithSystem = '';
    String reasonForNonPayment = '';
    String callOutcome = '';
    String followUpSchedule = '';
    bool includeTechnicalVisit = false;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Collection Call Script'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Agent Name: [Agent's Name]"), // Placeholder
                Text('Customer ID: ${record['customer_name'] ?? 'N/A'}'),

                // 1. Has the customer answered the call?
                const Text('1. Has the customer answered the call?'),
                DropdownButton<String>(
                  value: customerAnswered,
                  items: ['Yes', 'No', 'Unavailable']
                      .map((String value) => DropdownMenuItem<String>(
                          value: value, child: Text(value)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      customerAnswered = value!;
                    });
                  },
                ),

                // 2. Am I speaking with the correct customer?
                const Text('2. [Greeting], Am I speaking with customer name?'),
                DropdownButton<String>(
                  value: speakingToCustomer,
                  items: ['Yes', 'No']
                      .map((String value) => DropdownMenuItem<String>(
                          value: value, child: Text(value)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      speakingToCustomer = value!;
                    });
                  },
                ),

                // 3. Are you happy with your BBOXX solar system?
                const Text(
                    '3. Are you happy with your BBOXX solar system? Has it been working well?'),
                DropdownButton<String>(
                  value: happyWithSystem,
                  items: ['Yes', 'No']
                      .map((String value) => DropdownMenuItem<String>(
                          value: value, child: Text(value)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      happyWithSystem = value!;
                    });
                  },
                ),

                // 4. Reason for non-payment
                const Text(
                    '4. We have not received your payment for 89 days. Could you specify the reason for non-payment?'),
                DropdownButton<String>(
                  value: reasonForNonPayment,
                  items: [
                    'Believes to be paid off',
                    'Bought device from competition',
                    'Components defective',
                    'CU defective (not working)',
                    'CU defective (working without having pay)',
                    'Customer deceased',
                    'Does not tell us',
                    'Fire',
                    'Fraud by sales agents',
                    'Grief/funeral',
                    'Has money but can\'t pay',
                    'Have now electricity from the grid',
                    'Issue with subsidy',
                    'Not at home (travel, etc.)',
                    'Not satisfied with product',
                    'Other financial priorities',
                    'Person paying for customer stopped',
                    'School fees',
                    'Sickness (long term)',
                    'Sickness (short term)',
                    'System repossessed fraudulently',
                    'Theft',
                    'Waiting seasonal income',
                    'Other',
                  ]
                      .map((String value) => DropdownMenuItem<String>(
                          value: value, child: Text(value)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      reasonForNonPayment = value!;
                    });
                  },
                ),

                // 5. Additional Details
                const Text('5. Give more details for the answer above:'),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter details',
                  ),
                ),

                // 6. Advantages of making payments on time
                const Text(
                    '6. Explain the advantages of making payments on time. Ask for payment date.'),
                TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter follow-up details',
                  ),
                  onChanged: (value) {
                    followUpSchedule = value;
                  },
                ),

                // 7. Anything else I can assist with?
                const Text('7. Anything else I can assist you with?'),
                const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Additional comments',
                  ),
                ),

                // 8. Call Outcome
                const Text('8. Call Outcome?'),
                DropdownButton<String>(
                  value: callOutcome,
                  items: [
                    'Call back',
                    'Paid',
                    'Promised to pay',
                    'Return the kit',
                    'Awaiting issue resolution (on us)',
                    'Awaiting issue resolution (on customer)',
                    'Downgrade',
                    'Opt-out customer'
                  ]
                      .map((String value) => DropdownMenuItem<String>(
                          value: value, child: Text(value)))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      callOutcome = value!;
                    });
                  },
                ),

                // 9. Include technical visit ticket?
                const Text('9. Include technical visit ticket for the client?'),
                Row(
                  children: [
                    Checkbox(
                      value: includeTechnicalVisit,
                      onChanged: (bool? value) {
                        setState(() {
                          includeTechnicalVisit = value!;
                        });
                      },
                    ),
                    const Text('Yes'),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Submit'),
              onPressed: () {
                // Handle form submission
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Table'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Horizontal scroll
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical, // Vertical scroll
                child: DataTable(
                  sortAscending: _isAscending,
                  sortColumnIndex: _sortColumnIndex,
                  columns: [
                    DataColumn(
                      label: const Text('Activity Date'),
                      onSort: (columnIndex, ascending) => _sort<String>(
                          (record) => record['activity_date'],
                          columnIndex,
                          ascending),
                    ),
                    DataColumn(
                      label: const Text('Customer Name'),
                      onSort: (columnIndex, ascending) => _sort<String>(
                          (record) => record['customer_name'],
                          columnIndex,
                          ascending),
                    ),
                    DataColumn(
                      label: const Text('Sales Person'),
                      onSort: (columnIndex, ascending) => _sort<String>(
                          (record) => record['sales_person'],
                          columnIndex,
                          ascending),
                    ),
                    DataColumn(
                      label: const Text('Phone 1'),
                      onSort: (columnIndex, ascending) => _sort<String>(
                          (record) => record['customer_phone_1'],
                          columnIndex,
                          ascending),
                    ),
                    DataColumn(
                      label: const Text('Phone 2'),
                      onSort: (columnIndex, ascending) => _sort<String>(
                          (record) => record['customer_phone_2'],
                          columnIndex,
                          ascending),
                    ),
                    DataColumn(
                      label: const Text('Daily Rate'),
                      onSort: (columnIndex, ascending) => _sort<num>(
                          (record) => record['daily_rate'],
                          columnIndex,
                          ascending),
                    ),
                    DataColumn(
                      label: const Text('Shop'),
                      onSort: (columnIndex, ascending) => _sort<String>(
                          (record) => record['shop'], columnIndex, ascending),
                    ),
                    DataColumn(
                      label: const Text('Actions'),
                      // Adding action buttons to each row
                      onSort: (columnIndex, ascending) {},
                    ),
                  ],
                  rows: _data.map<DataRow>((record) {
                    return DataRow(cells: [
                      DataCell(Text(record['activity_date'] ?? 'N/A')),
                      DataCell(Text(record['customer_name'] ?? 'N/A')),
                      DataCell(Text(record['sales_person'] ?? 'N/A')),
                      DataCell(Text(record['customer_phone_1'] ?? 'N/A')),
                      DataCell(Text(record['customer_phone_2'] ?? 'N/A')),
                      DataCell(Text(record['daily_rate'].toString())),
                      DataCell(Text(record['shop'] ?? 'N/A')),
                      DataCell(
                        ElevatedButton(
                          onPressed: () => _showCallScript(context, record),
                          child: const Text('Call Script'),
                        ),
                      ),
                    ]);
                  }).toList(),
                ),
              ),
            );
          }
          return const Center(child: Text('No data found'));
        },
      ),
    );
  }
}
