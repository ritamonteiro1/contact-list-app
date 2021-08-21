import 'package:flutter/material.dart';
import 'package:list_dio_app/home_view.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: HomeView()
    );
  }
}
