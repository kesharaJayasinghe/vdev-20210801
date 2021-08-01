import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String routeName;

  const ErrorScreen({Key key, this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Error loading!'),
      ),
    );
  }
}
