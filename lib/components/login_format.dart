import 'package:flutter/material.dart';

import '../utils/config.dart';

class LoginFormat extends StatefulWidget {
  const LoginFormat({super.key});

  @override
  State<LoginFormat> createState() => _LoginFormatState();
}

class _LoginFormatState extends State<LoginFormat> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool obsecurePass = true;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              cursorColor: Config.primaryColor,
              decoration: const InputDecoration(
                  hintText: 'Email Address',
                  labelText: 'Email',
                  alignLabelWithHint: true,
                  prefixIcon: Icon(Icons.email_outlined),
                  prefixIconColor: Config.primaryColor),
            ),
            Config.spaceSmall,
            TextFormField(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: obsecurePass,
              cursorColor: Config.primaryColor,
              decoration: InputDecoration(
                  hintText: 'password',
                  labelText: 'password',
                  alignLabelWithHint: true,
                  prefixIcon: const Icon(Icons.lock_clock_outlined),
                  prefixIconColor: Config.primaryColor,
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obsecurePass = !obsecurePass;
                        });
                      },
                      icon: obsecurePass
                          ? const Icon(Icons.visibility_off_outlined)
                          : const Icon(Icons.visibility_outlined))),
            ),
            Config.spaceSmall,
            SizedBox(
              width: double.infinity,
              height: 40,
              child: OutlinedButton(
                style: ElevatedButton.styleFrom(
                    side: const BorderSide(width: 50),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white),
                onPressed: () {
                  Navigator.of(context).pushNamed('main');
                },
                child: const Text(
                  'SignIn',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ));
  }
}
