import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SlideOutMenuButton(),
      ),
    );
  }
}

class SlideOutMenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.3,
              maxChildSize: 0.8,
              minChildSize: 0.1,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 63, 38, 117),
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  child: ListView(
                    controller: scrollController,
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          'Item 1',
                          style: myTextStyle(),
                        ),
                        onTap: () {
                          // Add your action for item 1
                        },
                      ),
                      ListTile(
                        title: Text('Item 2', style: myTextStyle()),
                        onTap: () {
                          // Add your action for item 2
                        },
                      ),
                      ListTile(
                        title: Text('Item 3', style: myTextStyle()),
                        onTap: () {
                          // Add your action for item 3
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromARGB(255, 251, 167, 42),
        ),
        child: Center(
          child: Icon(
            Icons.menu,
            color: Color.fromARGB(255, 51, 38, 117),
            size: 30.0,
          ),
        ),
      ),
    );
  }
}

TextStyle myTextStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );
}
