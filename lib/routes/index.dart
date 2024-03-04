import 'package:flutter/material.dart';
import 'package:migrant/auth/change_pasword/index.dart';
import 'package:migrant/auth/forgot_password/index.dart';
import 'package:migrant/auth/login/index.dart';
import 'package:migrant/auth/registration/index.dart';
import 'package:migrant/navbar/index.dart';
import 'package:migrant/pages/choose_country.dart';
import 'package:migrant/pages/home_page.dart';
import 'package:migrant/pages/trip_info.dart';
import 'package:migrant/prifile_settings/index.dart';
import 'package:migrant/terms_and_conditions/index.dart';

class MigrantApp extends StatelessWidget {
  const MigrantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const LoginPage(),
        '/forget-password': (context) => const ForgotPassword(),
        '/registration': (context) => const RegistrationPage(),
        '/navigation': (context) => const Navigation(),
        '/trip-info': (context) => const TripInfo(),
        '/choose-country': (context) => const ChooseCountry(
              startCountry: null,
              endCountry: null,
            ),
        '/home-page': (context) => const HomePage(),
        '/profile-settings': (context) => const ProfileSettings(),
        '/change-password': (context) => const ChangePassword(),
        '/terms-and-conditions': (context) => const TermsAndConditions(),
      },
    );
  }
}
