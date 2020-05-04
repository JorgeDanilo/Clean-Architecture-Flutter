import 'dart:async';

import 'package:clean_architecture/di/di.dart';
import 'package:clean_architecture/ui/home_page.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection();
  runZoned<Future<Null>>(() async {
    runApp(MyApp());
  }, onError: (error, stackTrace) async {
    print(error);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}