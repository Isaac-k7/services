import 'package:flutter/material.dart';

class AppChangeTheme extends StatelessWidget {
  final Color color;
  final void Function() onPressed;

  const AppChangeTheme({
    Key? key,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
      child: IconButton(
          onPressed: onPressed,
          icon: Card(
            color: color,
            elevation: 10,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
            child: const SizedBox(
              width: 70,
              height: 70,
            ),
          )),
    );
  }
}