import 'package:flutter/material.dart';

import '../Pages/home.dart';

class Alertd extends StatelessWidget {
  const Alertd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 51, 38, 117),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: const BorderSide(
            color: Color.fromARGB(255, 98, 83, 184), width: 3.0),
      ),
      title: const Text('If you leave, The game will be lost',
          style: TextStyle(
            color: Color.fromARGB(255, 251, 167, 42),
            fontWeight: FontWeight.bold,
            fontFamily: 'MarheyVariableFont',
          )),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.lightGreen)),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text('Stay',
                    style: TextStyle(
                      color: Colors.lightGreen,
                      fontFamily: 'MarheyVariableFont',
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.red)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: const Text(
                  'Leave',
                  style: TextStyle(
                      fontFamily: 'MarheyVariableFont',
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
