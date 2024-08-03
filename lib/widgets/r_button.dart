import 'package:flutter/material.dart';

class RButton extends StatelessWidget {
  String label;
  Function()? onPressed;
  RButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: Text(label),
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(Size(112, 16)),
      ),
    );
  }
}
