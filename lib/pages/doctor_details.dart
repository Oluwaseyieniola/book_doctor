import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:niyi/components/custom_appbar.dart';
import 'package:niyi/utils/config.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomappBar(
        appTitle: 'Doctor Details',
        icon: const FaIcon(Icons.arrow_back_ios),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isFav = !isFav;
                });
              },
              icon: FaIcon(
                isFav ? Icons.favorite_rounded : Icons.favorite_outline,
                color: Colors.red,
              ))
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          const AboutDoctor(),
          const Doctoretails(),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: OutlinedButton(
                style: ElevatedButton.styleFrom(
                    side: const BorderSide(width: 50),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white),
                onPressed: () {
                  Navigator.of(context).pushNamed('booking_page');
                },
                child: const Text(
                  'Book Appointment',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/blackdoc.jpg'),
          ),
          Config.spaceSmall,
          const Text(
            'Dr sade',
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
          Config.spaceSmall,
          SizedBox(
            width: Config.widthSize * 0.6,
            child: const Text(
              'MBBS(International Medical student)',
              style: TextStyle(color: Colors.grey),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: Config.widthSize * 0.6,
            child: const Text(
              'Lagos state teaching hospital',
              style: TextStyle(color: Colors.grey),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class Doctoretails extends StatelessWidget {
  const Doctoretails({super.key});

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Config.spaceSmall,
          const DoctorInfo(),
          Config.spacemedium,
          const Text(
            'About Doctor',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const Text(
            'Dr sade is an experienced doctor with over 5 years experience',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
            softWrap: true,
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        Infocard(value: 'Patients', label: '109'),
        SizedBox(
          width: 15,
        ),
        Infocard(value: 'Experience', label: '5 years'),
        SizedBox(
          width: 15,
        ),
        Infocard(value: 'Rating', label: '4.8')
      ],
    );
  }
}

class Infocard extends StatelessWidget {
  const Infocard({super.key, required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Config.primaryColor),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      child: Column(
        children: <Widget>[
          Text(
            label,
            style: const TextStyle(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.w200),
          ),
          Text(
            value,
            style: const TextStyle(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.w200),
          )
        ],
      ),
    ));
  }
}
