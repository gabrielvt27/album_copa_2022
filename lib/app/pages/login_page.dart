import 'package:album2022/app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF861436),
                padding: const EdgeInsets.all(2),
              ),
              onPressed: () => Modular.get<AuthService>().signInWithGoogle(),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    color: Colors.white,
                    padding: const EdgeInsets.all(4),
                    child: Image.asset(
                      'assets/google.png',
                    ),
                  ),
                  const Spacer(),
                  const Text(
                    "Login with Google",
                    style: TextStyle(fontSize: 18),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
