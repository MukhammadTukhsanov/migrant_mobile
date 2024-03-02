import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TripCard extends StatelessWidget {
  String price;
  String startDate;
  String endDate;
  String startLocation;
  String endLocation;
  String user;
  String countOfFreeSeats;

  int passengers = 5;

  TripCard({
    super.key,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.startLocation,
    required this.endLocation,
    required this.user,
    required this.countOfFreeSeats,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/trip-info');
      },
      child: Container(
          width: double.infinity,
          // height: 200,
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
                              Text(startDate),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(endDate),
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
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
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 10,
                              ),
                              Text(
                                startLocation,
                                style: const TextStyle(
                                    color: Color(0xff455a64),
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                endLocation,
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
                            price,
                            style: const TextStyle(
                                color: Color(0xff455a64),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(user,
                                      style: const TextStyle(
                                          color: Color(0xff455a64),
                                          fontWeight: FontWeight.bold)),
                                  const Row(children: [
                                    Icon(Icons.star,
                                        color: Colors.yellow, size: 16),
                                    SizedBox(width: 5),
                                    Text(
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
                                            countOfFreeSeats,
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
                  )
                ],
              ))),
    );
  }
}
