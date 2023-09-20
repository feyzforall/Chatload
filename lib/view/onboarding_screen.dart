import 'package:chatload/constants/app_colors.dart';
import 'package:chatload/view/common_widgets/app_name_view.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppNameView(),
      ),
      body: const Stack(
        children: [
          BottomCircles(),
          HeadlineText(),
          DescriptionText(),
          ContinueButton(),
        ],
      ),
    );
  }
}

class HeadlineText extends StatelessWidget {
  const HeadlineText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      left: 10,
      right: 10,
      child: RichText(
        text: TextSpan(
          text: 'AI ',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: AppColors.frenchPass,
                fontWeight: FontWeight.bold,
              ),
          children: const [
            TextSpan(
              text: 'Chatbot Case',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 250,
      left: 10,
      right: 10,
      child: Text(
        "We've trained a model called ChatGPT which interacts in a conversational way.",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white,
            ),
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  const ContinueButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.1,
      left: 20,
      right: 20,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Continue'),
        ),
      ),
    );
  }
}

// Fancy circles at the bottom of the screen
class BottomCircles extends StatelessWidget {
  const BottomCircles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: -800,
          child: Container(
            width: 1000,
            height: 1000,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
        ),
        Positioned(
          bottom: -700,
          child: Container(
            width: 1000,
            height: 1000,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
        ),
        Positioned(
          bottom: -650,
          right: 0,
          child: Container(
            width: 1000,
            height: 1000,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.2),
            ),
          ),
        ),
        Positioned(
          bottom: -600,
          right: 10,
          left: 0,
          child: Container(
            width: 1200,
            height: 1200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
        ),
      ],
    );
  }
}
