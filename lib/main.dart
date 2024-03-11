import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:migrant/firebase_options.dart';
import 'package:migrant/providers/choose_country_provider.dart';
import 'package:migrant/routes/index.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ChooseCountryProvider()),
  ], child: const MigrantApp()));
}
