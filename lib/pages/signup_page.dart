import 'package:business_directory/controllers/signup_textfield_controller.dart';
import 'package:business_directory/utils/form_validator.dart';
import 'package:business_directory/widgets/form_footer.dart';
import 'package:business_directory/widgets/input_field_row.dart';
import 'package:business_directory/widgets/r_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  final textFieldController = Get.put(SignupTextfieldController());
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
          key: textFieldController.formKey,
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "readyToExplore".tr,
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
                      label: "firstName".tr,
                      hintText: "enterFirstName".tr,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: FormValidator.nameValidator,
                    ),
                    SizedBox(width: Get.width * 0.04),
                    RInputField(
                      controller: textFieldController.lastNameController,
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
                  controller: textFieldController.userNameController,
                  label: "userName".tr,
                  hintText: "enterUsername".tr,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: FormValidator.usernameValidator,
                ),
                SizedBox(height: Get.height * 0.02),
                RInputField(
                  controller: textFieldController.emailController,
                  label: "email".tr,
                  hintText: "enterEmail".tr,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: FormValidator.emailValidator,
                ),
                SizedBox(height: Get.height * 0.02),
                RInputField(
                  controller: textFieldController.passwordController,
                  label: "password".tr,
                  hintText: "enterPassword".tr,
                  obscureText: textFieldController.showPassword.value,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  suffixIcon: IconButton(
                    onPressed: () {
                      textFieldController.toggleShowPassword();
                    },
                    icon: Icon(
                      textFieldController.showPassword.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  validator: FormValidator.passwordValidtor,
                ),
                SizedBox(height: Get.height * 0.02),
                RInputField(
                  controller: textFieldController.rePasswordController,
                  label: "reEnterPassword".tr,
                  hintText: "enterRePassword".tr,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: textFieldController.showPassword.value,
                  textInputAction: TextInputAction.next,
                  validator: FormValidator.passwordValidtor,
                ),
                SizedBox(height: Get.height * 0.02),
                RButton(
                  label: "signup".tr,
                  onPressed: () {
                    if (textFieldController.formKey.currentState!.validate()) {
                      print("success");
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
            ),
          ),
        ),
      ),
    );
  }
}
