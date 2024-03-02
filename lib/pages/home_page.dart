import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:migrant/components/trip_card.dart';
import 'package:migrant/components/trip_tools.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // passengrs number
  final int passengers = 5;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          backgroundColor: Colors.blueGrey[50],
          // appBar: AppBar(
          //   title: const Text('Migrant'),
          //   leading: IconButton(
          //     style: ButtonStyle(
          //       backgroundColor:
          //           MaterialStateProperty.all(const Color(0xffcfd8dc)),
          //       padding: MaterialStateProperty.all(
          //         const EdgeInsets.all(8),
          //       ),
          //     ),
          //     icon: const Icon(Icons.person, color: Colors.white),
          //     onPressed: () {},
          //   ),
          //   actions: [
          //     IconButton(
          //       style: ButtonStyle(
          //         padding: MaterialStateProperty.all(
          //           const EdgeInsets.all(8),
          //         ),
          //       ),
          //       icon: const Icon(Icons.search, color: Colors.blueGrey),
          //       onPressed: () {},
          //     ),
          //   ],
          //   backgroundColor: Colors.white,
          // ),
          // trip info
          body: SingleChildScrollView(
              child: Column(children: [
            // trip tools
            TripTools(
                startingPoint: "Saint Petersburg",
                endingPoint: "Moscow",
                date: "Today",
                passengerCount: "1"),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TripCard(
                      price: "149 000",
                      startDate: "22 : 30",
                      endDate: "23 : 30",
                      startLocation: "Saint Petersburg",
                      endLocation: "Moscow",
                      user: "Alisher Haidarov",
                      countOfFreeSeats: "5")
                ],
              ),
            )
          ])),
        ),
      ),
    );
  }
}
