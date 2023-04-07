import 'package:flutter/material.dart';

import '../utils/config.dart';

class DyButton extends StatelessWidget {
  const DyButton({
    super.key,
    required this.width,
    required this.title,
    required this.disable,
  });

  final double width;
  final String title;
  final bool disable; // to disable the button

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Config.primaryColor,
              foregroundColor: Colors.white),
          onPressed: () {},
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
