import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../components/battoms/custom_button.dart';
import '../../components/logo/animation_logo.dart';
import '../auth/auth_login.dart';
import '../auth/auth_register.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AnimationLogo(size: 100),
              const SizedBox(width: 5),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText('Flash Chat'),
                  ],
                  isRepeatingAnimation: true,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          CustomButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthLogin(),
                ),
              );
            },
            text: 'Login',
            backgroundColor: const Color(0xff60B2EA),
          ),
          const SizedBox(height: 20),
          CustomButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthRegister(),
                ),
              );
            },
            text: 'Register',
            backgroundColor: const Color(0xff2671B6),
          ),
        ],
      ),
    );
  }
}
