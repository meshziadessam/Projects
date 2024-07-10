
import 'package:flutter/material.dart';


import '../player.dart';
import '../widget/AlertWidget.dart';
import '../widget/drawer.dart';
import '../widget/input.dart';
import 'Rules.dart';

class SecondRoute extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Player>? players; // Make the players parameter nullable

  SecondRoute({Key? key, this.players}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        drawer: const Drawerwidget(),
        backgroundColor: Colors.black,
        body: WillPopScope(
            onWillPop: () async {
              bool keepPage = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const Alertd();
                },
              );
              return keepPage;
            },
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 60, left: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _scaffoldKey.currentState!.openDrawer();
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 251, 167, 42),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.menu,
                                  color: Color.fromARGB(255, 51, 38, 117),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Rules(),
                                  ));
                            },
                            child: Image.asset(
                              'assets/images/LOGO.png',
                              width: 80,
                            ),
                          )
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        PlayerInput(players: players),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}

class Alert extends StatelessWidget {
  const Alert({
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
                  Navigator.of(context).pop(true);
                },
                child: const Text(
                  'Leave',
                  style: TextStyle(
                      fontFamily: 'MarheyVariableFont',
                      fontWeight: FontWeight.bold,
                      color: Colors.red
                      // لون الزر

                      ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

/**/