import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.bottomRenderCondtion,
  });

  final Widget? title;
  final List<Widget>? actions;
  final Widget? leading;
  final Rx<bool>? bottomRenderCondtion;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: title,
      centerTitle: true,
      actions: actions,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: Theme.of(context).textTheme.bodyLarge,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(8),
        child: Obx(
          () {
            return bottomRenderCondtion?.isTrue ?? false
                ? LinearProgressIndicator(
                    color: Theme.of(context).colorScheme.secondary,
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
