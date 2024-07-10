// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: AnimationDemo(),
//     );
//   }
// }

// class AnimationDemo extends StatefulWidget {
//   @override
//   _AnimationDemoState createState() => _AnimationDemoState();
// }

// class _AnimationDemoState extends State<AnimationDemo>
//     with TickerProviderStateMixin {
//   late AnimationController _controller1;
//   late AnimationController _controller2;
//   late AnimationController _controller3;
//   late Animation<Offset> _animation1;
//   late Animation<Offset> _animation2;
//   late Animation<Offset> _animation3;
//   late Animation<double> _fontSize1Animation;
//   late Animation<double> _fontSize2Animation;
//   late Animation<double> _fontSize3Animation;
//   final List<String> players = ['1', '2', '3', '4', '5'];
//   int _currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     // Controller 1
//     _controller1 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _animation1 = Tween<Offset>(
//       begin: Offset(1.0, 0.0),
//       end: Offset(0.0, 0.0),
//     ).animate(CurvedAnimation(
//       parent: _controller1,
//       curve: Curves.easeInOut,
//     ));
//     _fontSize1Animation = Tween<double>(
//       begin: 50.0,
//       end: 24.0,
//     ).animate(CurvedAnimation(
//       parent: _controller1,
//       curve: Curves.easeInOut,
//     ));
//     // Controller 2
//     _controller2 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _animation2 = Tween<Offset>(
//       begin: Offset(10.0, 0.4),
//       end: Offset(0.0, 0.0),
//     ).animate(CurvedAnimation(
//       parent: _controller2,
//       curve: Curves.easeInOut,
//     ));
//     _fontSize2Animation = Tween<double>(
//       begin: 24.0,
//       end: 50.0,
//     ).animate(CurvedAnimation(
//       parent: _controller2,
//       curve: Curves.easeInOut,
//     ));
//     // Controller 3
//     _controller3 = AnimationController(
//       duration: Duration(milliseconds: 500),
//       vsync: this,
//     );
//     _animation3 = Tween<Offset>(
//       begin: Offset(5.0, -0.4),
//       end: Offset(0.0, 0.0),
//     ).animate(CurvedAnimation(
//       parent: _controller3,
//       curve: Curves.easeInOut,
//     ));
//     _fontSize3Animation = Tween<double>(
//       begin: 50.0,
//       end: 24.0,
//     ).animate(CurvedAnimation(
//       parent: _controller3,
//       curve: Curves.easeInOut,
//     ));

//     startAnimation();
//   }

//   void startAnimation() {
//     _controller1.reset();
//     _controller2.reset();
//     _controller3.reset();
//     _controller1.forward();
//     _controller2.forward();
//     setState(() {
//       _currentIndex = (_currentIndex + 1) % players.length;
//     });

//     Future.delayed(Duration(milliseconds: 200), () {});
//     Future.delayed(Duration(milliseconds: 400), () {
//       _controller3.forward();
//     });
//   }

//   @override
//   void dispose() {
//     _controller1.dispose();
//     _controller2.dispose();
//     _controller3.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('test'),
//       ),
//       body: Center(
//         child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Stack(
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Center(
//                       child: AnimatedBuilder(
//                         animation: _fontSize2Animation,
//                         builder: (context, child) {
//                           return SlideTransition(
//                             position: _animation2,
//                             child: Text(
//                               players[(_currentIndex - 1 + players.length) %
//                                   players.length],
//                               style: TextStyle(
//                                 fontSize: _fontSize2Animation.value,
//                                 color: Color.fromARGB(255, 152, 216, 255),
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'MarheyVariableFont',
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       AnimatedBuilder(
//                         animation: _fontSize3Animation,
//                         builder: (context, child) {
//                           return SlideTransition(
//                             position: _animation3,
//                             child: Text(
//                               players[(_currentIndex - 2 + players.length) %
//                                   players.length],
//                               style: TextStyle(
//                                 fontSize: _fontSize3Animation.value,
//                                 color: Colors.blue,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'MarheyVariableFont',
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                       Text(
//                         players[(_currentIndex) % players.length],
//                         style: TextStyle(
//                           fontSize: 24,
//                           color: Colors.green,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'MarheyVariableFont',
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             )),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: startAnimation,
//         child: Icon(Icons.play_arrow),
//       ),
//     );
//   }
// }
