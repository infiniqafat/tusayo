import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:tusayo/src/screen/checkout.dart';
import 'package:tusayo/src/screen/home.dart';
import 'package:tusayo/src/screen/landing.dart';
import 'package:tusayo/src/screen/login.dart';
import 'package:tusayo/src/screen/product.dart';
import 'package:tusayo/src/screen/transaction.dart';

void main(){
  //runApp(MyApp());
  initializeDateFormatting("id_ID", null).then((_) =>runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => LandingPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/login': (context) => LoginPage(),
        '/home': (context) => MyHomePage(),
        '/account': (context) => LoginPage(),
        '/product': (context) => ProductPage(),
        '/checkout': (context) => CheckOutPage(),
        '/transaction': (context) => TransactionPage(),
      },
    );
  }
}
