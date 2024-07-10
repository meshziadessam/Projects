// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:card_swiper/card_swiper.dart';
// import 'package:flip_card/flip_card.dart';

// void main() {
//   runApp(TinderApp());
// }

// class TinderApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       highContrastDarkTheme: ThemeData.dark(useMaterial3: true),
//       home: TinderScreen(),
//     );
//   }
// }

// class TinderScreen extends StatefulWidget {
//   @override
//   _TinderScreenState createState() => _TinderScreenState();
// }

// class _TinderScreenState extends State<TinderScreen> {
//   List<String> imageUrls = [
//     'assets/images/2.png',
//     'assets/images/3.png',
//     'assets/images/4.png',
//     'assets/images/5.png',
//     'assets/images/6.png',
//     'assets/images/7.png',
//     'assets/images/8.png',
//     'assets/images/9.png',
//     'assets/images/10.png',
//     'assets/images/J.png',
//     'assets/images/Q.png',
//     'assets/images/K.png',
//     'assets/images/A.png',
//   ];

//   Random random = Random();
//   int randomIndex = 0;
//   final SwiperController _swiperController = SwiperController();

//   @override
//   void initState() {
//     super.initState();
//     randomIndex = random.nextInt(imageUrls.length);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('Tinder Swipe Cards'),
//       ),
//       body: Center(
//         child: Container(
//           height: MediaQuery.of(context).size.height * 0.60,
//           width: MediaQuery.of(context).size.width * 0.80,
//           decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color: Color.fromARGB(255, 51, 38, 117).withOpacity(0.4),
//                 spreadRadius: 1,
//                 blurRadius: 70,
//                 offset: Offset(0, 10), // changes position of shadow
//               ),
//             ],
//           ),
//           child: Swiper(
//             axisDirection: AxisDirection.right,
//             controller: _swiperController,
//             itemBuilder: (BuildContext context, int index) {
//               return GestureDetector(
//                 onPanUpdate: (details) {
//                   // Detect horizontal swipe direction and prevent left swipe
//                   if (details.delta.dx > 0) {
//                     // Swipe left detected, do nothing
//                   } else if (details.delta.dx < 0) {
//                     // Swipe right detected
//                     _swiperController.next();
//                   }
//                 },
//                 child: Card(
//                   color: Colors.black,
//                   child: FlipCard(
//                     side: CardSide.FRONT,
//                     speed: 500,
//                     front: Container(
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                         image: DecorationImage(
//                           image: AssetImage('assets/images/welcome.png'),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     back: Container(
//                       decoration: BoxDecoration(
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(8.0)),
//                         image: DecorationImage(
//                           image: AssetImage(imageUrls[randomIndex]),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//             itemCount: imageUrls.length,
//             itemWidth: MediaQuery.of(context).size.width * 0.75,
//             itemHeight: MediaQuery.of(context).size.height * 0.55,
//             layout: SwiperLayout.STACK,
//             curve: Curves.easeInOut, // Use smoother curve for animation
//             duration: 400,
//             onIndexChanged: (int index) {
//               setState(() {
//                 randomIndex = random.nextInt(imageUrls.length);
//               });
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
