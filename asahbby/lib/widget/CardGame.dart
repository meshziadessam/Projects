import 'dart:math';
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

  @override
  void initState() {
    super.initState();
    Map<String, String> randomCard = generateRandomCard();
    currentAsset = randomCard['asset'];
    currentText = randomCard['text'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Column(children: [
        backTop_Of_Page(),
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              if (currentAsset != null) // Check if currentAsset is not null
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    currentAsset!,
                    width: 200,
                  ),
                ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Card Function:',
                    style: TextStyle(
                        color: Color.fromARGB(255, 251, 167, 42),
                        fontSize: 24,
                        fontFamily: 'MarheyVariableFont',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      '${currentText ?? ''}',
                      style: TextStyle(
                          color: Color.fromARGB(255, 251, 167, 42),
                          fontSize: 24,
                          fontFamily: 'MarheyVariableFont',
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Map<String, String> randomCard = generateRandomCard();
                      currentAsset = randomCard['asset'];
                      currentText = randomCard['text'];
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
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DashboardPage(players: widget.players),
                      ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 251, 167, 42),
                ),
                child: Text(
                  'Dashboard',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 51, 38, 117),
                      fontWeight: FontWeight.w700),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}

class DashboardPage extends StatefulWidget {
  final List<Player> players;

  DashboardPage({required this.players});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            backTop_Of_Page(),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Dashboard',
                style: TextStyle(
                  color: Color.fromARGB(255, 251, 167, 42),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: MediaQuery.of(context).size.height - 200,
                child: ListView.builder(
                  itemCount: widget.players.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.players[index].name,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 251, 167, 42),
                                      fontSize: 25),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 51, 38, 117),
                                        borderRadius: BorderRadius.circular(
                                            8), // Rounded corners
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.remove,
                                            color: Colors.white),
                                        onPressed: () {
                                          setState(() {
                                            if (widget.players[index].score >
                                                0) {
                                              widget.players[index].score--;
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            8), // Add some space between the buttons
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        borderRadius: BorderRadius.circular(
                                            8), // Rounded corners
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.add,
                                            color: Colors.white),
                                        onPressed: () {
                                          setState(() {
                                            widget.players[index].score++;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Score: ${widget.players[index].score}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              SizedBox(width: 10),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
