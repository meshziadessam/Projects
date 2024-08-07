import 'package:Asahby/Pages/Rules.dart';
import 'package:Asahby/widget/drawer.dart';
import 'package:flutter/material.dart';

import 'input.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedPage = '';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: const Drawerwidget(),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
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
                          decoration:const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 251, 167, 42),
                          ),
                          child:const Center(
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
                    //Top_Of_Page(),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 30),
                          Image.asset(
                            'assets/images/LOGO.png',
                            width: 300,
                          ),
                          const SizedBox(height: 70),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SecondRoute(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                               const   Color.fromARGB(255, 251, 167, 42),
                              minimumSize: const Size(200, 60),
                            ),
                            child: const Text(
                              'Play Now',
                              style: TextStyle(
                                color: Color.fromARGB(255, 51, 38, 117),
                                fontSize: 28,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
