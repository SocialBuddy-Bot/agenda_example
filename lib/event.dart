import 'package:flutter/material.dart';

class Event {
  Event({
    @required this.name,
    @required this.start,
    this.end,
    this.isHandled = false,
  });

  final String name;
  final DateTime start;
  final DateTime end;
  final bool isHandled;
}
