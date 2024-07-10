
import 'package:flutter/material.dart';

import '../Pages/Dashboard.dart';
import 'CardGame.dart';

class DashboardButton extends StatelessWidget {
  const DashboardButton({
    super.key,
    required this.widget,
    required this.fontSize,
  });

  final CardGame widget;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DashboardPage(players: widget.players)));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 251, 167, 42),
        minimumSize: Size(100, 30),
      ),
      child: Text(
        'Dashboard',
        style: TextStyle(
            fontSize: fontSize,
            color: Color.fromARGB(255, 51, 38, 117),
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
