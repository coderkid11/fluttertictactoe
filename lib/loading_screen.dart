import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFE19C),
      child: Center(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                "assets/images/gameIcon-removebg.png",
                width: 150,
                height: 150,
              ),
            ),
            const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}