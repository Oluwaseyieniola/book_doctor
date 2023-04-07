import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppointmentBooked extends StatelessWidget {
  const AppointmentBooked({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(flex: 3, child: Lottie.asset('assets/images/success.json')),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: const Text(
              'Successfuly Booked an appointment',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: SizedBox(
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
                    'Go back to home',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ))
        ],
      )),
    );
  }
}
