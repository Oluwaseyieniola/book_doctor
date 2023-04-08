import 'package:flutter/material.dart';

import '../utils/config.dart';

class AppointmentCard extends StatefulWidget {
  const AppointmentCard({super.key});

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  bool _isFlipped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFlipped = !_isFlipped;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.2),
              Colors.blue.withOpacity(0.2),
            ],
          ),
        ),
        child: _isFlipped ? const BackWidget() : const FrontWidget(),
      ),
    );
  }
}

class FrontWidget extends StatelessWidget {
  const FrontWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ivy.jpg'),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Dr Sade',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Dental',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            Config.spaceSmall,
            const ScheduleApp(),
            Config.spaceSmall,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () {},
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Completed',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduleApp extends StatelessWidget {
  const ScheduleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[
          Icon(
            Icons.calendar_today,
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            '11/28/2022',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.alarm_on,
            color: Colors.white,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
              child: Text(
            '2:00PM',
            style: TextStyle(color: Colors.white),
          ))
        ],
      ),
    );
  }
}

// created this widget to display the back of the animated controller

class BackWidget extends StatelessWidget {
  const BackWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const <Widget>[
            Text(
              'Back Side',
              style: TextStyle(color: Colors.white),
            ),
            Config.spaceSmall,
            Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

// appointment scheduler

