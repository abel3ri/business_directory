import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppError {
  const AppError({
    required this.body,
  });

  final String body;

  void showError() {
    Get.closeAllSnackbars();
    Get.showSnackbar(
      GetSnackBar(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        duration: Duration(seconds: 3),
        animationDuration: Duration(milliseconds: 500),
        margin: EdgeInsets.symmetric(horizontal: 16),
        borderRadius: 10,
        dismissDirection: DismissDirection.horizontal,
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: Colors.red,
        messageText: Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              body,
              style: Get.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
