import 'package:business_directory/controllers/auth_controller.dart';
import 'package:business_directory/widgets/r_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProfilePage extends StatelessWidget {
  final authController = Get.find<AuthController>();
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Text(
          "Profile",
          style: Get.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () {
          final user = authController.currentUser.value;
          return Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                width: Get.width,
                decoration: BoxDecoration(
                  color: Get.theme.colorScheme.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (user != null) ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: SizedBox(
                          width: 96,
                          height: 96,
                          child: user.profileImageUrl != null
                              ? Image.network(
                                  user.profileImageUrl!,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset("assets/image.png");
                                  },
                                )
                              : Image.network(
                                  "https://eu.ui-avatars.com/api/?name=${user.firstName}+${user.lastName}&size=250",
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset("assets/image.png");
                                  },
                                ),
                        ),
                      ),
                      SizedBox(height: Get.height * 0.01),
                      Text(
                        '${user.firstName.capitalize} ${user.lastName.capitalize}',
                        style: Get.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: Get.height * 0.02),
                      ProfileDetailRow(
                        label: "email".tr,
                        data: "${user.email}".toLowerCase(),
                      ),
                      SizedBox(height: Get.height * 0.02),
                      ProfileDetailRow(
                        label: "username".tr,
                        data: '@${user.username}',
                      ),
                      SizedBox(height: Get.height * 0.02),
                      ProfileDetailRow(
                        label: "dateJoined".tr,
                        data: DateFormat.yMMMd("en-us").format(user.createdAt),
                      ),
                    ],
                    if (authController.currentUser.value == null) ...[
                      Text(
                        "Login or Sign up To View Your Profile",
                        style: Get.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RButton(
                            child: Text("signup".tr),
                            onPressed: () {
                              Get.toNamed("signup");
                            },
                          ),
                          SizedBox(width: 12),
                          RButton(
                            child: Text("login".tr),
                            onPressed: () {
                              Get.toNamed("login");
                            },
                          ),
                        ],
                      ),
                    ]
                  ],
                ),
              ),
              ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  ProfilePageTile(
                    title: "theme".tr,
                    onPressed: null,
                    icon: Icons.color_lens,
                    trailing: DropdownButton(
                      value: "system",
                      underline: SizedBox.shrink(),
                      elevation: 1,
                      borderRadius: BorderRadius.circular(8),
                      items: [
                        DropdownMenuItem(
                          child: Text("system".tr),
                          value: "system",
                        ),
                        DropdownMenuItem(
                          child: Text("light".tr),
                          value: "light",
                        ),
                        DropdownMenuItem(
                          child: Text("dark".tr),
                          value: "dark",
                        )
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                  ProfilePageTile(
                    title: "helpAndSupport".tr,
                    onPressed: () {},
                    icon: Icons.help,
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                  ProfilePageTile(
                    title: "privacyAndPolicy".tr,
                    icon: Icons.shield,
                    onPressed: () {},
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                  ProfilePageTile(
                    title: "termsAndConditions".tr,
                    icon: Icons.article_sharp,
                    onPressed: () {},
                    trailing: Icon(Icons.arrow_forward_ios_rounded),
                  ),
                  if (user != null)
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text("Logout"),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                      iconColor: Get.theme.colorScheme.error,
                      textColor: Get.theme.colorScheme.error,
                      titleTextStyle: Get.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      onTap: () async {
                        final res = await authController.logout();
                        res.fold((l) {
                          l.showError();
                        }, (r) {
                          Get.offAllNamed("getStarted");
                        });
                      },
                    ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class ProfileDetailRow extends StatelessWidget {
  const ProfileDetailRow({
    super.key,
    required this.label,
    required this.data,
  });

  final String label;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Get.textTheme.bodyLarge!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          data,
          style: Get.textTheme.bodyLarge!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class ProfilePageTile extends StatelessWidget {
  const ProfilePageTile({
    super.key,
    required this.title,
    required this.onPressed,
    required this.icon,
    required this.trailing,
  });

  final String title;
  final Function()? onPressed;
  final IconData icon;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      onTap: onPressed,
      title: Text(title),
      trailing: trailing,
      iconColor: Get.theme.colorScheme.primary,
    );
  }
}
