import 'dart:math';
import 'package:Asahby/Pages/Dashboard.dart';
import 'package:Asahby/widget/appbarwithback.dart';
import 'package:flutter/material.dart';

import '../player.dart';

class Card {
  String value;
  String text; // Add this line

  Card(this.value, this.text); // Modify the constructor
}

Map<String, String> generateRandomCard() {
  Map<String, String> cardValues = {
    'assets/images/2.png': 'ربع قرد',
    'assets/images/3.png': 'اوتوبيس كومبليت',
    'assets/images/4.png': 'عمري معملت',
    'assets/images/5.png': 'اخبط على الطرابيزة',
    'assets/images/6.png': 'اخبط على الطرابيزة',
    'assets/images/7.png': 'اخبط على الطرابيزة',
    'assets/images/8.png': 'وزن وقافية',
    'assets/images/9.png': 'براندات',
    'assets/images/10.png': 'بتدي الورقة لأي حد',
    'assets/images/J.png': 'بتقول نكتة',
    'assets/images/Q.png': 'محدش يرد عليه',
    'assets/images/K.png': 'بتاخدها انت',
    'assets/images/A.png': 'سؤال تعجيزي'
  };

  Random random = Random();
  String randomAsset =
      cardValues.keys.toList()[random.nextInt(cardValues.length)];
  String text = cardValues[randomAsset] ?? 'Unknown';

  return {'asset': randomAsset, 'text': text};
}

class CardGame extends StatefulWidget {
  final List<Player> players;

  CardGame({required this.players});

  @override
  _CardGameState createState() => _CardGameState();
}

class _CardGameState extends State<CardGame> {
  String? currentAsset;
  String? currentText;
  int currentPlayerIndex = 0;

  @override
  void initState() {
    super.initState();
    Map<String, String> randomCard = generateRandomCard();
    currentAsset = randomCard['asset'];
    currentText = randomCard['text'];
  }

  void changePlayer() {
    setState(() {
      currentPlayerIndex = (currentPlayerIndex + 1) % widget.players.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.05;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            backTop_Of_Page(),
            Column(
              children: [
                Text(
                  'Player name: ',
                  style: TextStyle(
                    color: Color.fromARGB(255, 251, 167, 42),
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MarheyVariableFont',
                  ),
                ),
                Text(
                  " ${widget.players[currentPlayerIndex].name}",
                  style: TextStyle(
                    color: Color.fromARGB(255, 156, 144, 218),
                    fontSize: fontSize * 1.5,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MarheyVariableFont',
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
              child: Column(
                children: [
                  if (currentAsset != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        currentAsset!,
                        width: 200,
                      ),
                    ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.02),
                      child: Text(
                        'Card Function:',
                        style: TextStyle(
                            color: Color.fromARGB(255, 251, 167, 42),
                            fontSize: fontSize * 1.2,
                            fontFamily: 'MarheyVariableFont',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.02),
                        child: Text(
                          '${currentText ?? ''}',
                          style: TextStyle(
                              color: Color.fromARGB(255, 251, 167, 42),
                              fontSize: fontSize * 1.2,
                              fontFamily: 'MarheyVariableFont',
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Map<String, String> randomCard = generateRandomCard();
                          currentAsset = randomCard['asset'];
                          currentText = randomCard['text'];
                          changePlayer();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 251, 167, 42),
                        minimumSize: Size(200, 50),
                      ),
                      child: const Text('Change Card',
                          style: TextStyle(
                              color: Color.fromARGB(255, 51, 38, 117),
                              fontSize: 25,
                              fontWeight: FontWeight.w800))),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DashboardPage(players: widget.players)));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 251, 167, 42),
                    ),
                    child: Text(
                      'Dashboard',
                      style: TextStyle(
                          fontSize: fontSize,
                          color: Color.fromARGB(255, 51, 38, 117),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
