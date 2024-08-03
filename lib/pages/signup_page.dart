import 'package:business_directory/controllers/text_field_controller.dart';
import 'package:business_directory/widgets/input_field_row.dart';
import 'package:business_directory/widgets/r_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  final textFieldController = Get.put(TextFieldController());
  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Ready to explore businesses?",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SizedBox(height: Get.height * 0.04),
              Row(
                children: [
                  RInputField(
                    controller: textFieldController.firstNameController,
                    label: "First name",
                    hintText: "Enter your first name",
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(width: Get.width * 0.04),
                  RInputField(
                    controller: textFieldController.lastNameController,
                    label: "Last name",
                    hintText: "Enter your last name",
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.02),
              RInputField(
                controller: textFieldController.emailController,
                label: "Username",
                hintText: "Enter your username",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: Get.height * 0.02),
              RInputField(
                controller: textFieldController.emailController,
                label: "E-mail",
                hintText: "Enter your email",
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: Get.height * 0.02),
              RInputField(
                controller: textFieldController.emailController,
                label: "Password",
                hintText: "Enter your password",
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.visibility),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              RInputField(
                controller: textFieldController.emailController,
                label: "Re-enter Password",
                hintText: "Enter your password again",
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: Get.height * 0.02),
              RButton(
                label: "Sign up",
                onPressed: () {},
              ),
              // SizedBox(height: Get.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Get.offNamed("login");
                    },
                    child: Text("Login"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
