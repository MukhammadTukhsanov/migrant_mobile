import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:migrant/components/date_picker.dart';
// import 'package:migrant/components/trip_card.dart';
// import 'package:migrant/components/trip_tools.dart';
// import 'package:migrant/pages/home_page.dart';
// import 'package:migrant/pages/home_page/choose_country_input.dart';
import 'package:migrant/pages/home_page/hom_page_sliver.dart';
// import 'package:migrant/pages/home_page/search_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const HomePageSliver();
  }
}
