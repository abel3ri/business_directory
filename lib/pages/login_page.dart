import 'package:business_directory/controllers/auth_controller.dart';
import 'package:business_directory/controllers/login_controller.dart';
import 'package:business_directory/utils/form_validator.dart';
import 'package:business_directory/widgets/form_footer.dart';
import 'package:business_directory/widgets/input_field_row.dart';
import 'package:business_directory/widgets/r_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final loginController = Get.put(LoginController());
  final authController = Get.find<AuthController>();

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
          key: loginController.formKey,
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "welcomeBack".tr,
                    style: Get.textTheme.headlineSmall!.copyWith(
                      color: Get.theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.04),
                RInputField(
                  controller: loginController.emailController,
                  label: "email".tr,
                  hintText: "enterEmail".tr,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: FormValidator.emailValidator,
                ),
                SizedBox(height: Get.height * 0.02),
                RInputField(
                  controller: loginController.passwordController,
                  label: "password".tr,
                  hintText: "enterPassword".tr,
                  obscureText: loginController.obscureText.value,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  suffixIcon: IconButton(
                    onPressed: () {
                      loginController.toggleShowPassword();
                    },
                    icon: Icon(
                      loginController.obscureText.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  validator: FormValidator.passwordValidtor,
                ),
                SizedBox(height: Get.height * 0.02),
                RButton(
                  child: !authController.isLoading.value
                      ? Text("login".tr)
                      : CProgressIndicator(),
                  onPressed: () async {
                    if (loginController.formKey.currentState!.validate()) {
                      final Map<String, dynamic> userData = {
                        "email": loginController.emailController.text,
                        "password": loginController.passwordController.text,
                      };
                      final res = await authController.loginUser(userData);
                      res.fold((l) {
                        l.showError();
                      }, (r) {
                        Get.offAllNamed("home-wrapper");
                      });
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

class CProgressIndicator extends StatelessWidget {
  const CProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: 16,
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}
