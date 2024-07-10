// import 'package:flutter/material.dart';
// import 'package:flip_card/flip_card.dart';
// import 'dart:math';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CardApp(),
//     );
//   }
// }

// class CardApp extends StatefulWidget {
//   @override
//   _CardAppState createState() => _CardAppState();
// }

// class _CardAppState extends State<CardApp> {
//   final List<String> cardContents = [
//     'Card 1 Content',
//     'Card 2 Content',
//     'Card 3 Content',
//     'Card 4 Content'
//   ];
//   final Random random = Random();
//   late String currentCardContent;

//   GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

//   @override
//   void initState() {
//     super.initState();
//     _randomizeCardContent();
//   }

//   void _randomizeCardContent() {
//     setState(() {
//       currentCardContent = cardContents[random.nextInt(cardContents.length)];
//     });
//   }

//   void _onButtonPressed() {
//     cardKey.currentState?.controller?.reverse();
//     Future.delayed(Duration(milliseconds: 400), () {
//       _randomizeCardContent();
//       cardKey = GlobalKey<FlipCardState>();  // Reset the key to ensure the card starts flipped
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Random Card Flipper'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             FlipCard(
//               key: cardKey,
//               flipOnTouch: true,
//               direction: FlipDirection.HORIZONTAL,
//               front: Card(
//                 child: Container(
//                   width: 200,
//                   height: 300,
//                   color: Colors.blue,
//                   child: Center(
//                     child: Text(
//                       'Tap to Flip',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 24,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               back: Card(
//                 child: Container(
//                   width: 200,
//                   height: 300,
//                   color: Colors.white,
//                   child: Center(
//                     child: Text(
//                       currentCardContent,
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 24,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _onButtonPressed,
//               child: Text('Change Card'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
