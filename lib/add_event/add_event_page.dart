import 'package:flutter/material.dart';

class AddEventPage extends StatelessWidget {
  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) {
        return AddEventPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Event'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Naam'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Startdatum'),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Opslaan'),
          ),
        ],
      ),
    );
  }
}
