import 'package:flutter/material.dart';
import 'package:niyi/components/login_format.dart';
import 'package:niyi/components/social_btn.dart';
import 'package:niyi/utils/text.dart';

import '../utils/config.dart';

class authPage extends StatefulWidget {
  const authPage({super.key});

  @override
  State<authPage> createState() => _authPageState();
}

class _authPageState extends State<authPage> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            Apptext.enText['welcome_text']!,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          Config.spaceSmall,
          Text(
            Apptext.enText['signIn_text']!,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Config.spaceSmall,
          // created the login details on a different page
          const LoginFormat(),
          Config.spaceSmall,
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                Apptext.enText['forgot-password']!,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          const Spacer(),
          Center(
              child: Text(
            Apptext.enText['social-login']!,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.grey.shade500),
          )),
          Config.spaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Socials(social: 'google'),
              Socials(social: 'facebook')
            ],
          ),
          Config.spaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                Apptext.enText['SignUp_text']!,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade500),
              ),
              const Text(
                'SignUp',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
          )
        ],
      )),
    ));
  }
}
