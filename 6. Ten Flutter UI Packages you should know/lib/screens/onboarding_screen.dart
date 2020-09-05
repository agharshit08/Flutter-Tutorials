import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:top_10/screens/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  
  final pageDecoration = PageDecoration(
    titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
    bodyTextStyle: TextStyle(fontSize: 19.0),
    descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: Colors.white,
    imagePadding: EdgeInsets.zero,
  );

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset(assetName, width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "YouTube Tutorials",
          body: "Quality Flutter tutorials only on BNB Tech.",
          image: _buildImage('assets/images/one.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Learn as you go",
          body: "UI, concepts, and much more related to Flutter.",
          image: _buildImage('assets/images/two.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Beginner to Advanced",
          body: "Something to learn for everyone!",
          image: _buildImage('assets/images/three.png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      showSkipButton: true,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}
