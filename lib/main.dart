import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:migrant/firebase_options.dart';
import 'package:migrant/routes/index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MigrantApp());
}
