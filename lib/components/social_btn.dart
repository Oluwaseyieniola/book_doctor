import 'package:flutter/material.dart';

import '../utils/config.dart';

class Socials extends StatelessWidget {
  const Socials({super.key, required this.social});
  final String social;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15),
          side: const BorderSide(width: 1, color: Colors.black)),
      onPressed: () {},
      child: SizedBox(
        width: Config.screenwidth! * 0.4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              'assets/images/$social.png',
              height: 40,
              width: 40,
            ),
            Text(
              social.toUpperCase(),
              style: const TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
