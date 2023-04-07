import 'package:flutter/material.dart';

import '../utils/config.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

// this is to show the status of the appointment
enum Filterstatus { upcoming, complete, cancel }

class _AppointmentPageState extends State<AppointmentPage> {
  Filterstatus status = Filterstatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> schedules = [
    {
      "doctor_name": "Dr drey",
      "doctor_profile": "assets/images/doc2.jpg",
      "category": "dental",
      "status": Filterstatus.complete
    },
    {
      "doctor_name": "Dr Taiwo",
      "doctor_profile": "assets/images/mandoc.jpg",
      "category": "dental",
      "status": Filterstatus.complete
    },
    {
      "doctor_name": "Dr sade",
      "doctor_profile": "assets/images/blackdoc.jpg",
      "category": "cardiology",
      "status": Filterstatus.cancel
    },
    {
      "doctor_name": "Dr jay",
      "doctor_profile": "assets/images/doc3.jpg",
      "category": "eye",
      "status": Filterstatus.upcoming
    },
    {
      "doctor_name": "Dr simi",
      "doctor_profile": "assets/images/splashdoc.jpg",
      "category": "eye",
      "status": Filterstatus.upcoming
    },
  ];
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    // i returned the filtered appointment
    List<dynamic> filteredschedules = schedules.where((var schedule) {
      // switch (schedule['status']) {
      //   case 'upcoming':
      //  schedule['status'] = Filterstatus.available;
      //   break;
      //  case 'complete':
      //    schedule['status'] = Filterstatus.unavailable;
      //     break;
      //    case 'cancel':
      //     schedule['status'] = Filterstatus.busy;
      //      break;
      //   }
      return schedule['status'] == status;
    }).toList();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Appointmnet schedule',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Config.spaceSmall,
            Stack(
              children: [
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (Filterstatus filterstatus in Filterstatus.values)
                        Expanded(
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (filterstatus == Filterstatus.upcoming) {
                                    status = Filterstatus.upcoming;
                                    _alignment = Alignment.centerLeft;
                                  } else if (filterstatus ==
                                      Filterstatus.complete) {
                                    status = Filterstatus.complete;
                                    _alignment = Alignment.center;
                                  } else if (filterstatus ==
                                      Filterstatus.cancel) {
                                    status = Filterstatus.cancel;
                                    _alignment = Alignment.centerRight;
                                  }
                                });
                              },
                              child: Center(child: Text(filterstatus.name))),
                        )
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        status.name,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Config.spaceSmall,
            Expanded(
                child: ListView.builder(
              itemCount: filteredschedules.length,
              itemBuilder: ((context, index) {
                var schedule = filteredschedules[index];
                bool isLastElement = filteredschedules.length + 1 == index;
                return Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: !isLastElement
                      ? const EdgeInsets.only(bottom: 20)
                      : EdgeInsets.zero,
                  child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      AssetImage(schedule['doctor_profile']),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      schedule['doctor_name'],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      schedule['category'],
                                      style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const ScheduleApp(),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: OutlinedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(color: Config.emamColour),
                                  ),
                                )),
                                const SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                    child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      backgroundColor: Config.primaryColor),
                                  onPressed: () {},
                                  child: const Text(
                                    'Reschedule',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ))
                              ],
                            )
                          ])),
                );
              }),
            ))
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
          color: Colors.grey, borderRadius: BorderRadius.circular(10)),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

// appointment scheduler


