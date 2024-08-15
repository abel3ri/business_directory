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
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        duration: Duration(seconds: 3),
        animationDuration: Duration(milliseconds: 300),
        snackStyle: SnackStyle.GROUNDED,
        borderRadius: 100,
        backgroundColor: Colors.red,
        messageText: Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: SizedBox(
            height: Get.height * 0.05,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                body,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
