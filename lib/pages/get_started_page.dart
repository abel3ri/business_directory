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
              Get.offNamed("home");
            },
            child: Text(
              "skip".tr,
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
              "welcomeToeTech".tr,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: Get.height * 0.02),
            Text(
              "letUsHelp".tr,
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
                text: "iAgreeTo".tr,
                children: [
                  TextSpan(
                    text: "termsOfServices".tr,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  TextSpan(
                    text: "confirmThat".tr,
                  ),
                  TextSpan(
                    text: "privacyPolicy".tr,
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
                    label: "login".tr,
                    onPressed: () {
                      Get.offNamed("login");
                    }),
                SizedBox(width: Get.width * 0.02),
                RButton(
                    label: "signup".tr,
                    onPressed: () {
                      Get.offNamed("signup");
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
