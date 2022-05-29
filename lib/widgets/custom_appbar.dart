import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 0, 119, 255),
      elevation: 0,
      title: Container(
        color: Color.fromARGB(255, 0, 119, 255),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: Colors.black),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55.0);
}
