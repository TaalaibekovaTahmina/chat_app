// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/modules/auth/auth_login.dart';
import 'package:chat_app/modules/auth/auth_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../components/battoms/custom_button.dart';
import '../../components/logo/animation_logo.dart';

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
            text: 'Login',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthLogin(),
                ),
              );
            },
            backgroundColor: const Color(0xff61B1EA),
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: 'Register',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthRegister(),
                ),
              );
            },
            backgroundColor: const Color(0xff2171B6),
          ),
        ],
      ),
    );
  }
}
