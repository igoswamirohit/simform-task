import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'app.dart';

void main() {
  setupLogging();
  runApp(const MyApp());
}

void setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    log('${rec.level.name}: ${rec.message}');
  });
}
