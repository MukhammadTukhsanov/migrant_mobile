import 'package:flutter/material.dart';
import 'package:migrant/components/gap.dart';

class TripInfo extends StatelessWidget {
  const TripInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        // foregroundColor: Colors.red,
        forceMaterialTransparency: false,
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
                                  Gap(size: 10),
                                  SizedBox(
                                    width: 10,
                                    height: 10,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  Gap(size: 10),
                                  const Text(
                                    'Moscow',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Gap(size: 10),
                              Row(
                                children: [
                                  const Text('23:30'),
                                  Gap(size: 10),
                                  SizedBox(
                                    width: 10,
                                    height: 10,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  Gap(size: 10),
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
                        Expanded(
                          child: Column(
                            children: [
                              const Text('1 hour'),
                              Gap(size: 10),
                              const Text('1 hour'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(size: 10),
                    Row(
                      children: [
                        const Text('Total time:'),
                        Gap(size: 10),
                        const Text('2 hours'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // end of box for trip info

            // box for separator
            Gap(size: 10),
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
            Gap(size: 10),
            // end of box for separator

            // box for driver info
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Alisher Haidarov",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Gap(size: 5),
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.yellow, size: 16),
                                Gap(size: 5),
                                const Text(
                                  '4.5',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  ' / ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  '5',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  ' - ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
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
                        const CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Text('AH'),
                        ),
                        // end of driver avatar
                      ],
                    ),

                    // box for separator
                    Gap(size: 10),
                    // end of box for separator

                    Row(
                      children: [
                        const Icon(Icons.verified_user, color: Colors.blueGrey),
                        Gap(size: 15),
                        const Text(
                          'Профиль подтвержден',
                          style: TextStyle(
                            color: Color(0xff757575),
                          ),
                        ),
                      ],
                    ),
                    Gap(size: 30),
                    const Divider(
                      height: 1,
                    ),
                    Gap(size: 30),
                    const Text(
                        "Здравствуйте, я водитель с большим стажем. Помогу вам доехать в любую точку города. В моем автомобиле вы будете чувствовать себя комфортно и безопасно.",
                        style: TextStyle(
                          color: Color(0xff757575),
                        )),
                    Gap(size: 30),
                    const Divider(
                      height: 1,
                    ),
                    Gap(size: 30),
                    Row(
                      children: [
                        const Icon(Icons.directions_car,
                            color: Colors.blueGrey),
                        Gap(size: 15),
                        const Text(
                          'Toyota Camry',
                          style: TextStyle(
                            color: Color(0xff757575),
                          ),
                        ),
                      ],
                    ),
                    Gap(size: 30),
                    const Divider(
                      height: 1,
                    ),
                    Gap(size: 30),
                    Row(
                      children: [
                        const Icon(Icons.phone, color: Colors.blueGrey),
                        Gap(size: 15),
                        const Text(
                          'Позвонить',
                          style: TextStyle(
                            color: Color(0xff757575),
                          ),
                        ),
                      ],
                    ),
                    Gap(size: 30),
                    const Divider(
                      height: 1,
                    ),
                    Gap(size: 30),
                    Row(
                      children: [
                        const Icon(Icons.message, color: Colors.blueGrey),
                        Gap(size: 15),
                        const Text(
                          'Написать',
                          style: TextStyle(
                            color: Color(0xff757575),
                          ),
                        ),
                      ],
                    ),
                    Gap(size: 30),
                    const Divider(
                      height: 1,
                    ),
                    Gap(size: 30),
                    Row(
                      children: [
                        const Icon(Icons.flag, color: Colors.blueGrey),
                        Gap(size: 15),
                        const Text(
                          'Пожаловаться',
                          style: TextStyle(
                            color: Color(0xff757575),
                          ),
                        ),
                      ],
                    ),
                    Gap(size: 30),
                    const Divider(
                      height: 1,
                    ),
                    Gap(size: 30),
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
