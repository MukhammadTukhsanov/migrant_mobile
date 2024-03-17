import 'package:flutter/material.dart';
import 'package:migrant/pages/home_page/trip_card/trip_card_item.dart';
import 'package:migrant/pages/home_page/trip_card/trip_card_item_model.dart';

class MyAdvertisements extends StatefulWidget {
  const MyAdvertisements({super.key});

  @override
  State<MyAdvertisements> createState() => _MyAdvertisementsState();
}

class _MyAdvertisementsState extends State<MyAdvertisements> {
  @override
  Widget build(BuildContext context) {
    final List<TripCardItemModel> myAdvertisements = [
      TripCardItemModel(
        price: "1000",
        startDate: '2021-10-10',
        endDate: '2021-10-20',
        startLocation: 'Tashkent',
        endLocation: 'Moscow',
        user: 'User',
        countOfFreeSeats: '2',
      ),
      TripCardItemModel(
        price: "2000",
        startDate: '2021-10-10',
        endDate: '2021-10-20',
        startLocation: 'Tashkent',
        endLocation: 'Moscow',
        user: 'User',
        countOfFreeSeats: '2',
      ),
      TripCardItemModel(
        price: "3000",
        startDate: '2021-10-10',
        endDate: '2021-10-20',
        startLocation: 'Tashkent',
        endLocation: 'Moscow',
        user: 'User',
        countOfFreeSeats: '2',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("My Advertisements"),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: myAdvertisements.isNotEmpty
            ? ListView.builder(
                itemCount: myAdvertisements.length,
                itemBuilder: (context, index) {
                  return TripCard(
                    card: myAdvertisements[index],
                  );
                },
              )
            : Center(
                child: SizedBox(
                  height: 300,
                  child: Column(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 180,
                        color: Colors.blueGrey.shade100,
                        weight: 100,
                      ),
                      Text(
                        "You have no advertisements yet",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.blueGrey.shade300,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
