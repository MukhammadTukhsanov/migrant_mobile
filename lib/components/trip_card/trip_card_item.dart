import 'package:flutter/material.dart';
import 'package:migrant/components/gap.dart';
import 'package:migrant/components/trip_card/trip_card_item_model.dart';

// ignore: must_be_immutable
class TripCard extends StatelessWidget {
  final TripCardItemModel card;

  int passengers = 5;

  TripCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/trip-info');
        // Navigator
      },
      child: Container(
          margin:
              const EdgeInsets.only(bottom: 10, left: 16, right: 16, top: 10),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 3,
                  offset: Offset(0, 0), // Shadow position
                ),
              ]),
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(children: [
                          Column(
                            children: [
                              Text(card.startDate),
                              Gap(size: 30),
                              Text(card.endDate),
                            ],
                          ),
                          Gap(size: 10),
                          Column(
                            children: [
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xff607d8b)),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              Container(
                                height: 40,
                                width: 2,
                                color: const Color(0xff607d8b),
                              ),
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xff607d8b)),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ],
                          ),
                          Gap(size: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 10,
                              ),
                              Text(
                                card.startLocation,
                                style: const TextStyle(
                                    color: Color(0xff455a64),
                                    fontWeight: FontWeight.bold),
                              ),
                              Gap(size: 30),
                              Text(
                                card.endLocation,
                                style: const TextStyle(
                                    color: Color(0xff455a64),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ]),
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            card.price,
                            style: const TextStyle(
                                color: Color(0xff455a64),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ))
                    ],
                  ),
                  Gap(size: 20),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey[400],
                                child: const Text('AH'),
                              ),
                              Gap(size: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(card.user,
                                      style: const TextStyle(
                                          color: Color(0xff455a64),
                                          fontWeight: FontWeight.bold)),
                                  Row(children: [
                                    const Icon(Icons.star,
                                        color: Colors.yellow, size: 16),
                                    Gap(size: 5),
                                    const Text(
                                      '4.5',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ]),
                                ],
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              passengers > 4
                                  ? Container(
                                      height: 40,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xff90a4ae),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons
                                                .airline_seat_recline_extra_rounded,
                                            color: Color(0xff546e7a),
                                          ),
                                          Text(
                                            card.countOfFreeSeats,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff546e7a)),
                                          )
                                        ],
                                      ),
                                    )
                                  : Row(
                                      children: [
                                        ...List.generate(
                                          passengers,
                                          (index) => const Icon(Icons
                                              .airline_seat_recline_extra_rounded),
                                        )
                                      ],
                                    )
                            ],
                          ))
                    ],
                  ),
                ],
              ))),
    );
  }
}
