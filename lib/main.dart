import 'package:flutter/material.dart';
import 'package:niyi/pages/auth_page.dart';
import 'package:niyi/pages/bookingPage.dart';
import 'package:niyi/pages/doctor_details.dart';
import 'package:niyi/pages/success_book.dart';
import 'package:niyi/utils/config.dart';
import 'package:niyi/utils/main_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Doctor',
      theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
              focusColor: Config.primaryColor,
              border: Config.OutlinedBorder,
              focusedBorder: Config.focusBorder,
              errorBorder: Config.errorBorder,
              enabledBorder: Config.OutlinedBorder,
              floatingLabelStyle: TextStyle(
                color: Config.primaryColor,
              ),
              prefixIconColor: Colors.black),
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Config.primaryColor,
              selectedItemColor: Colors.white,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              unselectedItemColor: Colors.grey,
              elevation: 10,
              type: BottomNavigationBarType.fixed)),
      initialRoute: '/',
      routes: {
        '/': (context) => const authPage(),
        'main': (context) => const MainLayout(),
        'doc_details': (context) => const DoctorDetails(),
        'booking_page': (context) => const BookingPage(),
        'success_booking': (context) => const AppointmentBooked()
      },
    );
  }
}

// started this on the 28th of march 2023 at 16:34 pm in room 18 NH BU

// An app that allows users to  book appointment with doctors at anytime implemented with laravel backend

// 1. doctor appopintment UI (LOGIN, HOME, BOOKING PAGE)
// 2.Laravel setup and configuration
//3.  Login auth using jwt
// 4.laravel doctor dashboard
// 5. get data