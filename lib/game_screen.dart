import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

import 'game_logic.dart';
import 'colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GameLogic _gameLogic;

// TODO:
// FIX THE STUPID ALINGMENT OF THE STUPID GRID

  @override
  void initState() {
    super.initState();
    _gameLogic = GameLogic();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: flutterNesTheme(),
      home: Scaffold(
        backgroundColor: paleYellow,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                height: 300,
                child: Stack(
                  children: [
                    // Grid lines
                    Positioned.fill(
                      child: buildGridLines(),
                    ),
                    // Functional game grid
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildGridRow([0, 1, 2]),
                        buildGridRow([3, 4, 5]),
                        buildGridRow([6, 7, 8]),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Restart button
              NesIconButton(
                onPress: () {
                  setState(() {
                    _gameLogic.restartGame();
                  });
                },
                icon: NesIcons.redo,
                size: const Size.square(40),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Custom function to build each row of the grid
  Widget buildGridRow(List<int> indices) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: indices.map((index) => buildGridCell(index)).toList(),
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
        width: 88, // Slightly smaller to fit grid lines better
        height: 88,
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

  // Function to build the background grid with proper alignment
  Widget buildGridLines() {
    return Stack(
      children: [
        // Vertical lines
        Positioned(
          left: 97.5, // Centered more precisely
          top: 0,
          bottom: 0,
          child: Container(
            width: 8,
            color: Colors.black,
          ),
        ),
        Positioned(
          left: 195, // Adjusted to fit between grid cells
          top: 0,
          bottom: 0,
          child: Container(
            width: 8,
            color: Colors.black,
          ),
        ),
        // Horizontal lines
        Positioned(
          top: 97.5,
          left: 0,
          right: 0,
          child: Container(
            height: 8,
            color: Colors.black,
          ),
        ),
        Positioned(
          top: 195,
          left: 0,
          right: 0,
          child: Container(
            height: 8,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
