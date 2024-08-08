import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormFooter extends StatelessWidget {
  const FormFooter({
    super.key,
    required this.label,
    required this.text,
  });

  final String label;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label),
        TextButton(
          onPressed: () {
            Get.offNamed("login");
          },
          child: Text(text),
        ),
      ],
    );
  }
}
