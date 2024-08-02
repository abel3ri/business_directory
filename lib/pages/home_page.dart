import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: const Center(
        child: Text.rich(
          TextSpan(text: "You have pressed the button ", children: [
            TextSpan(
              text: "2 times",
            ),
          ]),
        ),
      ),
    );
  }
}
