import 'package:flutter/material.dart';
import 'package:migrant/navbar/index.dart';
import 'package:migrant/pages/choose_country.dart';
import 'package:migrant/pages/home_page.dart';
import 'package:migrant/pages/trip_info.dart';
import 'package:migrant/prifile_settings/index.dart';

class MigrantApp extends StatelessWidget {
  const MigrantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Navigation(),
        '/trip-info': (context) => const TripInfo(),
        '/choose-country': (context) => const ChooseCountry(
              startCountry: null,
              endCountry: null,
            ),
        '/home-page': (context) => const HomePage(),
        '/profile-settings': (context) => const ProfileSettings(),
      },
    );
  }
}
