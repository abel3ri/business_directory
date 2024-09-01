import 'package:flutter/material.dart';

class RButton extends StatelessWidget {
  Widget child;
  Function()? onPressed;
  RButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: child,
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(Size(112, 16)),
      ),
    );
  }
}
