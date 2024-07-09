// ignore_for_file: file_names, non_constant_identifier_names

import 'package:Asahby/widget/appbarwithback.dart';
import 'package:flutter/material.dart';
import '../player.dart';
import 'input.dart';

class DashboardPage extends StatefulWidget {
  final List<Player> players;

  const DashboardPage({super.key, required this.players});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool showScore = false;

  void toggleScore() {
    setState(() {
      showScore = !showScore;
    });
  }

  void resetScores() {
    setState(() {
      for (var player in widget.players) {
        player.score = 0;
      }
    });
  }

  void checkScore(int index) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const backTop_Of_Page(),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Dashboard',
                style: TextStyle(
                  color: Color.fromARGB(255, 251, 167, 42),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: TextButton(
                    onPressed: toggleScore,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.edit_square,
                          color: Color.fromARGB(255, 152, 216, 255),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          showScore ? 'Stop Editing' : 'Edit Score',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 152, 216, 255),
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'MarheyVariableFont',
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0, left: 15.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 300,
                child: ListView.builder(
                  itemCount: widget.players.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 30),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.players[index].name,
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 251, 167, 42),
                                          fontSize: 25),
                                    ),
                                    Row(
                                      children: [
                                        if (showScore)
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 51, 38, 117),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: IconButton(
                                              icon: const Icon(Icons.remove,
                                                  color: Colors.white),
                                              onPressed: () {
                                                setState(() {
                                                  if (widget.players[index]
                                                          .score >
                                                      0) {
                                                    widget
                                                        .players[index].score--;
                                                  }
                                                });
                                              },
                                            ),
                                          ),
                                        const SizedBox(width: 8),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: IconButton(
                                            icon: const Icon(Icons.add,
                                                color: Colors.white),
                                            onPressed: () {
                                              Alert(index, context);
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
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

  void Alert(int index, BuildContext context) {
    return setState(() {
      widget.players[index].score++;
      if (widget.players[index].score == 12) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              backgroundColor: const Color.fromARGB(255, 51, 38, 117),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(
                    color: Color.fromARGB(255, 98, 83, 184), width: 3.0),
              ),
              title: const Text('Game Over',
                  style: TextStyle(
                    color: Color.fromARGB(255, 251, 167, 42),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'MarheyVariableFont',
                  )),
              content: Text('${widget.players[index].name} loses!',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 251, 167, 42),
                    fontWeight: FontWeight.bold,
                  )),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 251, 167, 42),
                        borderRadius: BorderRadius.circular(5)),
                    child: TextButton(
                        onPressed: () {
                          resetScores();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SecondRoute(players: widget.players),
                            ),
                          );
                        },
                        child: const Text(
                          'Restart',
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        )),
                  ),
                ),
              ],
            );
          },
        );
      }
    });
  }
}
