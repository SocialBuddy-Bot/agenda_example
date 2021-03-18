import 'package:agenda/add_event/add_event_page.dart';
import 'package:agenda/add_event/add_event_page.dart';
import 'package:agenda/add_event/add_event_page.dart';
import 'package:agenda/event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final eventsStream =
        FirebaseFirestore.instance.collection('events').snapshots();

    return Scaffold(
      appBar: AppBar(
        title: Text('Agenda'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(AddEventPage.route());
        },
        child: Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: eventsStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final documents = snapshot.data.docs.map((doc) => doc.data());

          final events = <Event>[
            for (final document in documents)
              Event(
                name: document['name'],
                start: (document['start'] as Timestamp).toDate(),
                isHandled: document['is_handled'] ?? false,
              ),
          ];

          return ListView(
            children: [
              for (final event in events)
                ListTile(
                  enabled: !event.isHandled,
                  leading: Icon(Icons.alarm_outlined),
                  title: Text(event.name),
                  subtitle: Text('Begint op ${event.start}'),
                ),
            ],
          );
        },
      ),
    );
  }
}
