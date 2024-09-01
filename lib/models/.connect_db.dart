import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PostgreSQL Query Results',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CollectionRateView(),
    );
  }
}

class CollectionRateView extends StatefulWidget {
  const CollectionRateView({super.key});

  @override
  _CollectionRateViewState createState() => _CollectionRateViewState();
}

class _CollectionRateViewState extends State<CollectionRateView> {
  late Future<List<Map<String, dynamic>>> _collectionRateData;

  @override
  void initState() {
    super.initState();
    _collectionRateData = fetchCollectionRateData();
  }

  Future<List<Map<String, dynamic>>> fetchCollectionRateData() async {
    // Establish connection to the PostgreSQL database
    final conn = await Connection.open(Endpoint(
      host: 'bboxxkenyapostgreserver.postgres.database.azure.com',
      database: 'bboxxkenya',
      username: 'DavidRobert',
      password: 'B3ncars0n',
    ));

    // Execute the query to retrieve the first 10 rows from 'collection_rate'
    final result = await conn.execute('SELECT * FROM collection_rate LIMIT 10');

    // Close the connection
    await conn.close();

    // Convert result to a list of maps
    return result.map((row) => row.toColumnMap()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Collection Rate Data'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _collectionRateData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data found'));
          } else {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final row = data[index];
                return ListTile(
                  title: Text('Row $index'),
                  subtitle: Text(row.entries
                      .map((entry) => '${entry.key}: ${entry.value}')
                      .join(', ')),
                );
              },
            );
          }
        },
      ),
    );
  }
}
