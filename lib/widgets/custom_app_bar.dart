import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.bottomRenderCondtion,
    this.centerTitle = true,
  });

  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final Rx<bool>? bottomRenderCondtion;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: title,
      centerTitle: centerTitle,
      actions: actions,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: Get.textTheme.bodyLarge,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(8),
        child: Obx(
          () {
            return bottomRenderCondtion?.isTrue ?? false
                ? LinearProgressIndicator(
                    color: Get.theme.colorScheme.secondary,
                  )
                : SizedBox();
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 8);
}
