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
          buttonColor: orange,
          textTheme: ButtonTextTheme.primary,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: darkPurple),
          bodyMedium: TextStyle(color: darkPurple),
          displayLarge: TextStyle(
              color: brightOrange, fontWeight: FontWeight.bold),
        ),
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
            ),
          ],
        ),
        body: Center(
          child: SizedBox(
            width: 300, // Make sure both grid lines and game grid have the same size
            height: 300,
            child: Stack(
              children: [
                // Background grid lines, for debugging purposes
                Positioned.fill(
                  child: buildGridLines(),
                ),
                // Functional game grid using rows and columns
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // First row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildGridCell(0),
                        buildGridCell(1),
                        buildGridCell(2),
                      ],
                    ),
                    // Second row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildGridCell(3),
                        buildGridCell(4),
                        buildGridCell(5),
                      ],
                    ),
                    // Third row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildGridCell(6),
                        buildGridCell(7),
                        buildGridCell(8),
                      ],
                    ),
                  ],
                ),
                IconButton(
                      onPressed: () {
                        setState(() {
                          _gameLogic.restartGame();
                        });
                      },
                      icon: const Icon(Icons.refresh),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Custom function to build grid cells
  Widget buildGridCell(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _gameLogic.makeMove(index);
          _gameLogic.checkWin();
        });
      },
      child: Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.transparent, // Transparent to avoid overlap with grid lines
        ),
        child: Center(
          child: Text(
            _gameLogic.board[index] ?? "",
            style: const TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  // Updated function to build the background grid with proper alignment
  Widget buildGridLines() {
    return Stack(
      children: [
        // Vertical lines
        Positioned(
          left: 96.5, // Adjusted alignment for vertical lines
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
          left: 196.5, // Adjusted alignment for vertical lines
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
          top: 96, // Adjusted alignment for horizontal lines
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
          top: 196, // Adjusted alignment for horizontal lines
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
    );
  }
}
