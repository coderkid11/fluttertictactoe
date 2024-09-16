import 'dart:io';

class GameLogic {
  // Board State

  List<String?> board = List.filled(9, null);

  // Player State

  String currentPlayer = "X";

  // Make Move

  void makeMove(int index) {
    if (board[index] == null) {
      board[index] = currentPlayer;

      print("$currentPlayer has made a move at $index");
      if (currentPlayer == "X") {
        currentPlayer = "O";
      } else {
        currentPlayer = "X";
      }
    } else {
      print("$currentPlayer has made an invalid move at $index");
    }
  }

  Future<void> checkWin() async {
    if (
      board[0] == "X" && board[1] == "X" && board[2] == "X" ||
      board[3] == "X" && board[4] == "X" && board[5] == "X" ||
      board[6] == "X" && board[7] == "X" && board[8] == "X" ||

      board[0] == "X" && board[3] == "X" && board[6] == "X" ||
      board[1] == "X" && board[4] == "X" && board[7] == "X" ||
      board[2] == "X" && board[5] == "X" && board[8] == "X" ||

      board[0] == "X" && board[4] == "X" && board[8] == "X" ||
      board[2] == "X" && board[4] == "X" && board[6] == "X" ||

      board[0] == "O" && board[1] == "O" && board[2] == "O" ||
      board[3] == "O" && board[4] == "O" && board[5] == "O" ||
      board[6] == "O" && board[7] == "O" && board[8] == "O" ||

      board[0] == "O" && board[3] == "O" && board[6] == "O" ||
      board[1] == "O" && board[4] == "O" && board[7] == "O" ||
      board[2] == "O" && board[5] == "O" && board[8] == "O" ||

      board[0] == "O" && board[4] == "O" && board[8] == "O" ||
      board[2] == "O" && board[4] == "O" && board[6] == "O"
    ) {
      print("$currentPlayer has won the game");
      win();
    }
  }

  // Win Game

  void win() {}

  // Restart Game

  void restartGame() {
    board = List.filled(9, null);
    currentPlayer = "X";
  }
}
