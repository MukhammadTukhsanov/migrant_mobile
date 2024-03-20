import 'package:flutter/material.dart';
import 'package:migrant/pages/change_pasword_/index.dart';
import 'package:migrant/pages/forget_password_/index.dart';
import 'package:migrant/pages/login_/index.dart';
import 'package:migrant/pages/registration_/index.dart';
import 'package:migrant/navbar/index.dart';
import 'package:migrant/pages/choose_country/index.dart';
import 'package:migrant/pages/trip_info_/index.dart';
import 'package:migrant/pages/profile_page/profile_settings_page.dart';
import 'package:migrant/pages/terms_and_conditions/index.dart';
import 'package:migrant/pages/welcom/index.dart';

class MigrantApp extends StatelessWidget {
  const MigrantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/forget-password': (context) => const ForgetPassword(),
        '/registration': (context) => const RegistrationPage(),
        '/navigation': (context) => const Navigation(),
        '/trip-info': (context) => const TripInfo(),
        '/choose-country': (context) => ChooseCountry(),
        '/profile-settings': (context) => const ProfileSettings(),
        '/change-password': (context) => const ChangePassword(),
        '/terms-and-conditions': (context) => const TermsAndConditions(),
      },
    );
  }
}
