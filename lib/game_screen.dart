import 'package:flutter/material.dart';

import 'game_logic.dart';
import 'colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GameLogic _gameLogic;

  @override
  void initState() {
    super.initState();
    _gameLogic = GameLogic();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
        primaryColor: darkPurple,
        hintColor: brightOrange,
        scaffoldBackgroundColor: paleYellow,
        buttonTheme: const ButtonThemeData(
          buttonColor: orange, // Button color
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: darkPurple), // Default text color
          bodyMedium: TextStyle(color: darkPurple),
          displayLarge: TextStyle(color: brightOrange, fontWeight: FontWeight.bold),
          // Add other text styles as needed
        ),
        // Add other theme customizations as needed
      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: darkPurple,
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _gameLogic.restartGame();
                  });
                },
                icon: const Icon(Icons.refresh),
              )
            ],
          ),
          body: Center(
            child: SizedBox(
              width: 300,
              height: 300,
              child: Stack(
                children: [
                  buildGridLines(),
                  GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _gameLogic.makeMove(index);
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 4.0,
                            ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Center(
                          child: Text(
                            _gameLogic.board[index] ?? "",
                            style: const TextStyle(fontSize: 40),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 9,
                ),
                ],
              ),
            ),
          )),
    );
  }

   // Function to build the background grid with thick, rounded lines
  Widget buildGridLines() {
    return SizedBox(
      width: 300,
      height: 300,
      child: Stack(
        children: [
          // Vertical lines
          Positioned(
            left: 100,
            top: 0,
            bottom: 0,
            child: Container(
              width: 8,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
            ),
          ),
          Positioned(
            left: 200,
            top: 0,
            bottom: 0,
            child: Container(
              width: 8,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
            ),
          ),
          // Horizontal lines
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Container(
              height: 8,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            child: Container(
              height: 8,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8), // Rounded corners
              ),
            ),
          ),
        ],
      ),
    );
  }
}
