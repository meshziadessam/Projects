import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import '../Pages/Dashboard.dart';
import '../player.dart';
// import 'package:vibration/vibration.dart';

import 'Dashboardbutton.dart';
import 'appbarwithback.dart';

class Card {
  String value;
  String text;

  Card(this.value, this.text);
}

class CardGame extends StatefulWidget {
  final List<Player> players;

  CardGame({required this.players});

  @override
  _CardGameState createState() => _CardGameState();
}

class _CardGameState extends State<CardGame>
    with SingleTickerProviderStateMixin {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  String? currentAsset;
  String? currentText;
  late int pastIndex;
  late int currentIndex;
  late int futureIndex;
  bool isCardFlipped = false;

  @override
  void initState() {
    super.initState();
    isCardFlipped = false;
    Map<String, String> randomCard = generateRandomCard();
    currentAsset = randomCard['asset'];
    currentText = randomCard['text'];
    currentIndex = 0; // Initialize currentIndex to 0
    pastIndex = currentIndex - 1; // Initialize pastIndex to currentIndex - 1
    futureIndex = currentIndex + 1;
    if (pastIndex == -1) {
      pastIndex = widget.players.length -
          1; // Set pastIndex to the last element in the list
    }
  }

  List<String> shownCards = [];
  Map<String, int> cardAppearances = {};

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

    // Filter out cards that have appeared 4 times
    cardValues.removeWhere((key, value) => cardAppearances[key] == 4);

    // If no cards are left, it means all cards have appeared 4 times, reset
    if (cardValues.isEmpty) {
      shownCards.clear();
      cardAppearances.clear();
      cardValues = {
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
    }

    Random random = Random();
    String randomAsset =
        cardValues.keys.toList()[random.nextInt(cardValues.length)];
    String text = cardValues[randomAsset] ?? 'Unknown';

    // Add the shown card to the list and update its appearance count
    shownCards.add(randomAsset);
    cardAppearances[randomAsset] = (cardAppearances[randomAsset] ?? 0) + 1;

    return {'asset': randomAsset, 'text': text};
  }

  void _onButtonPressed() {
    //  print(shownCards);
    //print(shownCards.length);
    if (shownCards.length >= 52) {
      // Show dialog and navigate to dashboard
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Game Over'),
            content: Text('All cards have been shown. The game has ended.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) =>
                            DashboardPage(players: widget.players)),
                  ); // Navigate to dashboard
                },
              ),
            ],
          );
        },
      );
    } else {
      cardKey.currentState?.controller?.reverse();
      Future.delayed(Duration(milliseconds: 400), () {
        Map<String, String> randomCard = generateRandomCard();
        currentAsset = randomCard['asset'];
        currentText = randomCard['text'];
        switchNames();
        // Vibration.hasVibrator().then((hasVibrator) {
        //   if (hasVibrator != null && hasVibrator) {
        //     Vibration.vibrate(duration: 300);
        //   }
        // }
        //  );
        cardKey = GlobalKey<FlipCardState>();
      });
    }
  }

  void switchNames() {
    setState(() {
      pastIndex = currentIndex;
      currentIndex = futureIndex;
      futureIndex = (futureIndex + 1) % widget.players.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width * 0.05;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
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
                //=======================================================================================
                Container(
                  height: MediaQuery.of(context).size.height * 0.049,
                  width: 10000,
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Column(
                      children: [
                        Text(
                          ' ${widget.players[currentIndex].name}',
                          style: TextStyle(
                            fontSize: 24,
                            color: Color.fromARGB(255, 251, 167, 42),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'MarheyVariableFont',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 10.0, left: 10.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [],
                  ),
                ),
                //=======================================================================================

                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        cardKey.currentState!.toggleCard();
                      },
                      child: FlipCard(
                        key: cardKey,
                        flipOnTouch: false, // Disable flipping on touch
                        front: Container(
                          height: MediaQuery.of(context).size.height *
                              0.4, // Adjust height to ensure visibility
                          width: MediaQuery.of(context).size.width *
                              0.55, // Adjust width to ensure visibility
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            image: DecorationImage(
                              image: AssetImage('assets/images/welcome.png'),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 51, 38, 117),
                                offset:
                                    Offset(4, 4), // changes position of shadow
                                blurRadius: 10.0, // softens the shadow
                                spreadRadius: 2.0, // extends the shadow
                              ),
                            ],
                          ),
                        ),
                        back: Container(
                          height: MediaQuery.of(context).size.height *
                              0.4, // Adjust height to ensure visibility
                          width: MediaQuery.of(context).size.width *
                              0.55, // Adjust width to ensure visibility
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            image: DecorationImage(
                              image: AssetImage(currentAsset!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: Padding(
                    //     padding: EdgeInsets.only(
                    //         left: MediaQuery.of(context).size.width * 0.02),
                    //     child: Text(
                    //       'Card Function:',
                    //       style: TextStyle(
                    //           color: Color.fromARGB(255, 251, 167, 42),
                    //           fontSize: fontSize * 1.0,
                    //           fontFamily: 'MarheyVariableFont',
                    //           fontWeight: FontWeight.bold),
                    //     ),
                    //   ),
                    // ),
                    // Align(
                    //     alignment: Alignment.centerRight,
                    //     child: Padding(
                    //       padding: EdgeInsets.only(
                    //           right: MediaQuery.of(context).size.width * 0.02),
                    //       child: Text(
                    //         '${currentText ?? ''}',
                    //         style: TextStyle(
                    //             color: Color.fromARGB(255, 251, 167, 42),
                    //             fontSize: fontSize * 1.0,
                    //             fontFamily: 'MarheyVariableFont',
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //     )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    ElevatedButton(
                      onPressed: _onButtonPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 251, 167, 42),
                        minimumSize: Size(180, 40),
                      ),
                      child: const Text(
                        'Change Card',
                        style: TextStyle(
                            color: Color.fromARGB(255, 51, 38, 117),
                            fontSize: 23,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.006),
                    DashboardButton(widget: widget, fontSize: fontSize),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ],
                ),
              ],
            ),
          ]),
        ));
  }
}
