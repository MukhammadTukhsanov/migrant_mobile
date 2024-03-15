import 'package:flutter/material.dart';

class TripInfo extends StatelessWidget {
  const TripInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Migrant'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // box for trip info
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Text('22:30'),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width: 10,
                                    height: 10,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'Moscow',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Text('23:30'),
                                  const SizedBox(width: 10),
                                  SizedBox(
                                    width: 10,
                                    height: 10,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Text(
                                    'St. Petersburg',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          child: Column(
                            children: [
                              Text('1 hour'),
                              SizedBox(height: 10),
                              Text('1 hour'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Text('Total time:'),
                        SizedBox(width: 10),
                        Text('2 hours'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // end of box for trip info

            // box for separator
            const SizedBox(height: 10),
            // end of box for separator

            // box for price
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Итог за 1 пассажира',
                      // style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '149 000 sõm',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            // end of box for price

            // box for separator
            const SizedBox(height: 10),
            // end of box for separator

            // box for driver info
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Alisher Haidarov",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.yellow, size: 16),
                                SizedBox(width: 5),
                                Text(
                                  '4.5',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  ' / ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '5',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  ' - ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '5 отзывов',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // driver avatar
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Text('AH'),
                        ),
                        // end of driver avatar
                      ],
                    ),

                    // box for separator
                    SizedBox(height: 10),
                    // end of box for separator

                    Row(
                      children: [
                        Icon(Icons.verified_user, color: Colors.blueAccent),
                        SizedBox(width: 15),
                        Text(
                          'Профиль подтвержден',
                          style: TextStyle(
                            color: Color(0xff757575),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Divider(
                      height: 1,
                    ),
                    SizedBox(height: 30),
                    Text(
                        "Здравствуйте, я водитель с большим стажем. Помогу вам доехать в любую точку города. В моем автомобиле вы будете чувствовать себя комфортно и безопасно.",
                        style: TextStyle(
                          color: Color(0xff757575),
                        )),
                    SizedBox(height: 30),
                    Divider(
                      height: 1,
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Icon(Icons.directions_car, color: Colors.blueAccent),
                        SizedBox(width: 15),
                        Text(
                          'Toyota Camry',
                          style: TextStyle(
                            color: Color(0xff757575),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Divider(
                      height: 1,
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Icon(Icons.phone, color: Colors.blueAccent),
                        SizedBox(width: 15),
                        Text(
                          'Позвонить',
                          style: TextStyle(
                            color: Color(0xff757575),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Divider(
                      height: 1,
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Icon(Icons.message, color: Colors.blueAccent),
                        SizedBox(width: 15),
                        Text(
                          'Написать',
                          style: TextStyle(
                            color: Color(0xff757575),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Divider(
                      height: 1,
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Icon(Icons.flag, color: Colors.blueAccent),
                        SizedBox(width: 15),
                        Text(
                          'Пожаловаться',
                          style: TextStyle(
                            color: Color(0xff757575),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Divider(
                      height: 1,
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Path: lib/pages/trip_info.dart
