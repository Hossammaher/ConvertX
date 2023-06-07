
import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() {
  runApp(ConvertX());
}

class ConvertX extends StatefulWidget {
  @override
  State<ConvertX> createState() => _ConvertX();
}

class _ConvertX extends State<ConvertX> {
  @override
  initState() {
    super.initState();
    // CurrencyService service = CurrencyService();
    // service.getCurrencyData();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
