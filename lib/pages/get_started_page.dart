import 'package:business_directory/widgets/r_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {
              Get.toNamed("home");
            },
            child: Text(
              "Skip",
            ),
            style: ButtonStyle(
              textStyle: WidgetStatePropertyAll(
                Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to eTech's Business Directory",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              "Let us help you explore local business with ease!",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: Get.height * 0.04),
            Center(
              child: Icon(
                Icons.business,
                size: 260,
              ),
            ),
            Spacer(),
            Text.rich(
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              TextSpan(
                text: "I agree to eTech's BD ",
                children: [
                  TextSpan(
                    text: "Terms of Serivces ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  TextSpan(
                    text: "and confirm that I have read eTech's BD ",
                  ),
                  TextSpan(
                    text: "Privacy Policy",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RButton(
                    label: "Login",
                    onPressed: () {
                      Get.toNamed("login");
                    }),
                SizedBox(width: Get.width * 0.02),
                RButton(
                    label: "Sign up",
                    onPressed: () {
                      Get.toNamed("signup");
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
