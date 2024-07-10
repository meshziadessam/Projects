import 'package:flutter/material.dart';
import '../player.dart';
import 'CardGame.dart';

class PlayerInput extends StatefulWidget {
  final List<Player>? players;
  final void Function(List<Player>)? onPlayersUpdated;

  const PlayerInput({Key? key, this.players, this.onPlayersUpdated})
      : super(key: key);
  @override
  _PlayerInputState createState() => _PlayerInputState();
}

class _PlayerInputState extends State<PlayerInput> {
  List<Player> players = [];
  TextEditingController controller = TextEditingController();

  final InputDecoration _inputDecoration = const InputDecoration(
    labelText: 'Enter player name',
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFFBAB2A)),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    labelStyle: TextStyle(color: Color(0xFFFBAB2A)),
    hintStyle: TextStyle(color: Color(0xFFFBAB2A)),
  );

  @override
  void initState() {
    super.initState();
    players = widget.players ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextField(
            controller: controller,
            decoration: _inputDecoration,
            style: TextStyle(color: Colors.white),
            onChanged: (value) {},
            onSubmitted: (value) {
              if (controller.text.isNotEmpty) {
                setState(() {
                  players.add(Player(name: controller.text));
                  controller.clear();
                  widget.onPlayersUpdated?.call(players);
                });
              }
            },
          ),
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border:
                Border.all(color: Color.fromARGB(255, 51, 38, 117), width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  players[index].name,
                  style: TextStyle(color: Colors.white),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.orange,
                  onPressed: () {
                    setState(() {
                      players.removeAt(index);
                      widget.onPlayersUpdated?.call(players);
                    });
                  },
                ),
              );
            },
          ),
        ),
        SizedBox(height: 40),
        ElevatedButton(
          onPressed: players.length >= 3
              ? () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CardGame(players: players),
                    ),
                  );
                }
              : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 251, 167, 42),
            minimumSize: Size(200, 60),
            shape: RoundedRectangleBorder(
              side: players.isEmpty
                  ? BorderSide(
                      width: 1, color: Color.fromARGB(255, 51, 38, 117))
                  : BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Start Now',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color.fromARGB(255, 51, 38, 117),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
