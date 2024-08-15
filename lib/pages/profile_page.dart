import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 48,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 64,
                ),
              ),
              SizedBox(height: Get.height * 0.01),
              Text(
                "Full Name",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
              SizedBox(height: Get.height * 0.02),
              ProfileDetailRow(
                label: "E-mail",
                data: "test@test.com",
              ),
              SizedBox(height: Get.height * 0.02),
              ProfileDetailRow(
                label: "Phone",
                data: "+251900000000",
              ),
              SizedBox(height: Get.height * 0.02),
              ProfileDetailRow(
                label: "Date Joined",
                data: "Aug 16, 2024",
              ),
            ],
          ),
        ),
        ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            ProfilePageTile(
              title: "Theme",
              onPressed: null,
              icon: Icons.color_lens,
              trailing: DropdownButton(
                value: "system",
                underline: SizedBox.shrink(),
                elevation: 1,
                borderRadius: BorderRadius.circular(8),
                items: [
                  DropdownMenuItem(
                    child: Text("System"),
                    value: "system",
                  ),
                  DropdownMenuItem(
                    child: Text("Light"),
                    value: "light",
                  ),
                  DropdownMenuItem(
                    child: Text("Dark"),
                    value: "dark",
                  )
                ],
                onChanged: (value) {},
              ),
            ),
            ProfilePageTile(
              title: "Help & Support",
              onPressed: () {},
              icon: Icons.help,
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ProfilePageTile(
              title: "Privacy Policy",
              icon: Icons.shield,
              onPressed: () {},
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
            ProfilePageTile(
              title: "Terms & Conditions",
              icon: Icons.article_sharp,
              onPressed: () {},
              trailing: Icon(Icons.arrow_forward_ios_rounded),
            ),
          ],
        ),
      ],
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
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        Text(
          data,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
      iconColor: Theme.of(context).colorScheme.primary,
    );
  }
}
