import 'dart:io';

import 'package:business_directory/controllers/auth_controller.dart';
import 'package:business_directory/controllers/image_controller.dart';
import 'package:business_directory/controllers/signup_controller.dart';
import 'package:business_directory/pages/image_picker_page.dart';
import 'package:business_directory/utils/form_validator.dart';
import 'package:business_directory/widgets/form_footer.dart';
import 'package:business_directory/widgets/input_field_row.dart';
import 'package:business_directory/widgets/r_button.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  final signupController = Get.put(SignupController());
  final imageController = Get.put(ImageController());
  final authController = Get.put(AuthController());
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
          key: signupController.formKey,
          child: Obx(
            () {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "readyToExplore".tr,
                      style: Get.textTheme.headlineSmall!.copyWith(
                        color: Get.theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.04),
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 36,
                        backgroundColor:
                            Get.theme.scaffoldBackgroundColor.darken(10),
                        backgroundImage: imageController.imagePath.value != null
                            ? FileImage(File(imageController.imagePath.value!))
                            : null,
                        child: imageController.imagePath.value != null
                            ? null
                            : Icon(
                                Icons.person,
                                size: 32,
                              ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              backgroundColor:
                                  Get.theme.scaffoldBackgroundColor,
                              // barrierColor: Colors.transparent,
                              context: context,
                              builder: (context) => ImagePickerPage(),
                              constraints: BoxConstraints(
                                maxHeight: Get.height * 0.3,
                              ),
                              showDragHandle: true,
                            );
                          },
                          child: Icon(
                            Icons.add,
                            size: 24,
                            color: Get.theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.04),
                  Row(
                    children: [
                      RInputField(
                        controller: signupController.firstNameController,
                        label: "firstName".tr,
                        hintText: "enterFirstName".tr,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        validator: FormValidator.nameValidator,
                      ),
                      SizedBox(width: Get.width * 0.04),
                      RInputField(
                        controller: signupController.lastNameController,
                        label: "lastName".tr,
                        hintText: "enterLastName".tr,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        validator: FormValidator.nameValidator,
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.02),
                  RInputField(
                    controller: signupController.userNameController,
                    label: "userName".tr,
                    hintText: "enterUsername".tr,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: FormValidator.usernameValidator,
                  ),
                  SizedBox(height: Get.height * 0.02),
                  RInputField(
                    controller: signupController.emailController,
                    label: "email".tr,
                    hintText: "enterEmail".tr,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    validator: FormValidator.emailValidator,
                  ),
                  SizedBox(height: Get.height * 0.02),
                  RInputField(
                    controller: signupController.passwordController,
                    label: "password".tr,
                    hintText: "enterPassword".tr,
                    obscureText: signupController.obscureText.value,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    suffixIcon: IconButton(
                      onPressed: () {
                        signupController.toggleShowPassword();
                      },
                      icon: Icon(
                        signupController.obscureText.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    validator: FormValidator.passwordValidtor,
                  ),
                  SizedBox(height: Get.height * 0.02),
                  RInputField(
                    controller: signupController.rePasswordController,
                    label: "reEnterPassword".tr,
                    hintText: "enterRePassword".tr,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: signupController.obscureText.value,
                    textInputAction: TextInputAction.next,
                    validator: FormValidator.passwordValidtor,
                  ),
                  SizedBox(height: Get.height * 0.02),
                  RButton(
                    child: Text("signup".tr),
                    onPressed: () async {
                      if (signupController.formKey.currentState!.validate()) {
                        final userData = {
                          "email": signupController.emailController.text,
                          "username": signupController.userNameController.text,
                          "firstName":
                              signupController.firstNameController.text,
                          "lastName": signupController.lastNameController.text,
                          "password": signupController.passwordController.text,
                          "confirmPassword":
                              signupController.rePasswordController.text,
                        };

                        final res = await authController.signupUser(userData);
                        res.fold((l) {
                          l.showError();
                        }, (r) {
                          Get.offNamed("home-wrapper");
                        });
                      }
                    },
                  ),
                  FormFooter(
                    label: "alreadyHaveAccount".tr,
                    text: 'login'.tr,
                    onPressed: () {
                      Get.offNamed("login");
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
