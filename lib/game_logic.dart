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

  // Restart Game

  void restartGame() {
    board = List.filled(9, null);
    currentPlayer = "X";
  }
}