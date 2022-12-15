import 'package:flutter/material.dart';
import 'package:mcfooddriver/ui/HomeMain.dart';
import 'package:mcfooddriver/ui/subpage/ListOrderSub.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Google Maps Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeMain(),
    );
  }
}
