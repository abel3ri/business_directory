import 'package:business_directory/controllers/login_textfield_controller.dart';
import 'package:business_directory/utils/form_validator.dart';
import 'package:business_directory/widgets/form_footer.dart';
import 'package:business_directory/widgets/input_field_row.dart';
import 'package:business_directory/widgets/r_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final textFieldController = Get.put(LoginTextfieldController());

  LoginPage({super.key});

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
                    "welcomeBack".tr,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                SizedBox(height: Get.height * 0.04),
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
                RButton(
                  label: "login".tr,
                  onPressed: () {
                    if (textFieldController.formKey.currentState!.validate()) {
                      print("success");
                    }
                  },
                ),
                FormFooter(
                  label: "dontHaveAccount".tr,
                  text: 'signup'.tr,
                  onPressed: () {
                    Get.offNamed("signup");
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
