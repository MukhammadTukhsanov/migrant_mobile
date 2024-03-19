import 'package:flutter/material.dart';
import 'package:migrant/components/gap.dart';

class TripInfo extends StatelessWidget {
  const TripInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        forceMaterialTransparency: false,
        surfaceTintColor: Colors.white,
        title: const Text('Migrant'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TripPlan(
              startTime: '22:30',
              startDate: '22.12.2021',
              endTime: '23:30',
              endDate: '23.12.2021',
              startCity: 'Moscow',
              endCity: 'St. Petersburg',
            ),
            Gap(size: 10),
            TripInfoListItem(
                text: 'Итог за 1 пассажира: ',
                trailing: const Text('149 000 сом',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
            UserInfo(
              userName: 'Александр',
              userSurname: 'Иванов',
              userRating: 4.5,
              isProfileVerified: true,
              countOfReviews: 10,
            ),
            const Divider(height: 1),
            TripInfoListItem(
                text:
                    'Здравствуйте, я водитель с 10 летним стажем вождения и безаварийным стажем 5 лет. Всегда вовремя и безопасно доставлю вас в любую точку города. Приятной поездки!'),
            TripInfoListItem(
              prefixIcon: Icons.directions_car,
              text: 'Toyota Camry 2018',
            ),
            TripInfoListItem(
              prefixIcon: Icons.airline_seat_recline_extra_rounded,
              text: '1 свободное место',
            ),
            TripInfoListItem(
              prefixIcon: Icons.local_gas_station,
              text: 'Бензин включен',
            ),
            TripInfoListItem(
              prefixIcon: Icons.smoking_rooms,
              text: 'Курение разрешено',
            ),
            TripInfoListItem(
              prefixIcon: Icons.call,
              text: '+996 555 555 555',
            ),
            TripInfoListItem(
              prefixIcon: Icons.message,
              text: 'Написать',
            ),
            TripInfoListItem(
              prefixIcon: Icons.flag,
              text: 'Пожаловаться',
            ),
            Gap(size: 10),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TripInfoListItem extends StatelessWidget {
  IconData? prefixIcon;
  Widget? trailing;
  bool devider = true;
  String text;
  TripInfoListItem(
      {super.key, this.prefixIcon, required this.text, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(size: 10),
        ListTile(
            leading: prefixIcon == null
                ? null
                : Icon(prefixIcon, color: Colors.blueGrey),
            title: Text(
              text,
              style: const TextStyle(
                color: Color(0xff757575),
              ),
            ),
            trailing: trailing),
        Gap(size: 10),
        if (devider) const Divider(height: 1),
      ],
    );
  }
}

//ignore: must_be_immutable
class UserInfo extends StatelessWidget {
  String userName;
  String userSurname;
  double userRating;
  bool isProfileVerified;
  double countOfReviews;

  UserInfo(
      {super.key,
      required this.userName,
      required this.userRating,
      required this.isProfileVerified,
      required this.countOfReviews,
      required this.userSurname});
  @override
  // ignore: avoid_renaming_method_parameters
  Widget build(BuildContext) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$userName $userSurname',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Gap(size: 5),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 16),
                    Gap(size: 5),
                    Text(userRating.toString(),
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                    const Text(' / ',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                    const Text('5',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                    const Text(' - ',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                    Text('$countOfReviews отзывов',
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            CircleAvatar(
              backgroundColor: Colors.grey,
              child: Text(userName[0] + userSurname[0]),
            ),
          ],
        ),
        Gap(size: 10),
        if (isProfileVerified)
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
      ]),
    );
  }
}

// ignore: must_be_immutable
class TripPlan extends StatelessWidget {
  String startTime;
  String endTime;
  String startDate;
  String endDate;
  String startCity;
  String endCity;

  TripPlan(
      {super.key,
      required this.startTime,
      required this.endTime,
      required this.startDate,
      required this.endDate,
      required this.startCity,
      required this.endCity});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      startCity,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                    Row(
                      children: [
                        Text(startTime,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey)),
                        Gap(size: 5),
                        const Text("|",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey)),
                        Gap(size: 5),
                        Text(startDate,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey)),
                      ],
                    ),
                  ],
                ),
                const Icon(Icons.arrow_forward, color: Colors.blueGrey),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      endCity,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                    Row(
                      children: [
                        Text(endTime,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey)),
                        Gap(size: 5),
                        const Text("|",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey)),
                        Gap(size: 5),
                        Text(endDate,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}
