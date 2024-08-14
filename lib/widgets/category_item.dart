import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  String name;
  IconData icon;
  Color? color;
  Function()? onTap;
  CategoryItem({
    super.key,
    required this.onTap,
    required this.name,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          CircleAvatar(
            child: Icon(
              icon,
              color: Colors.white,
            ),
            backgroundColor: color ?? Theme.of(context).colorScheme.primary,
          ),
          SizedBox(height: 4),
          Text(name),
        ],
      ),
    );
  }
}
