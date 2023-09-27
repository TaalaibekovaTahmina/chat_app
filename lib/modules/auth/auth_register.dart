import 'package:chat_app/modules/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../components/battoms/custom_button.dart';

class AuthRegister extends StatefulWidget {
  const AuthRegister({Key? key}) : super(key: key);

  @override
  _AuthRegisterState createState() => _AuthRegisterState();
}

class _AuthRegisterState extends State<AuthRegister> {
  final ctlEmail = TextEditingController();
  final ctlPasword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: ctlEmail,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 14),
              TextFormField(
                controller: ctlPasword,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: 'Register',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (ctlEmail.text.isNotEmpty && ctlEmail.text.isNotEmpty) {
                      await register(
                        email: ctlEmail.text,
                        password: ctlEmail.text,
                      );
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                      );
                      FocusManager.instance.primaryFocus?.unfocus();
                    } else {
                      print('ctlEmail or ctlPassword is empty');
                    }
                  }
                },
                backgroundColor: const Color(0xff2171B6),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
