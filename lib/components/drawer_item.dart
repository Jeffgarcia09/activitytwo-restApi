import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.icon,
    required this.name,
    required this.onPressed,
  });

  final String name;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.blue,
            ),
            const SizedBox(width: 40),
            Text(
              name,
              style: TextStyle(fontSize: 18, color: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
