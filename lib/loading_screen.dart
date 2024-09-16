import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:go_router/go_router.dart';

import 'colors.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool _showLogo = true;

  @override
  void initState() {
    super.initState();
    _startFadeAnimation();
  }

  void _startFadeAnimation() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _showLogo = false;
    });
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: paleYellow,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/gameIcon-removebg.png',
                width: 150,
                height: 150,
              ),
              AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                child: _showLogo
                    ? const Padding(
                        padding:  EdgeInsets.only(top: 21.0, left: 30, bottom: 21.0),
                        child:  NesPixelRowLoadingIndicator(),
                      )
                    : NesButton(
                        onPressed: () {
                          // TODO Better Animation!
                          context.go('/home');
                        },
                        type: NesButtonType.normal,
                        child: const Text(
                          'Start Game',
                          style: TextStyle(
                            color: darkPurple,
                            fontSize: 20,
                          ),
                        ),
                      ),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              )
            ],
          ),
        ));
  }
}
