import 'package:flutter/material.dart';
import 'package:migrant/components/gap.dart';
import 'package:url_launcher/url_launcher.dart';

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
            const Divider(height: 1),
            TripInfoListItem(
                text: 'Итог за 1 пассажира: ',
                trailing: Text('149 000 сом',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.blueGrey.shade800))),
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
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.blueGrey, size: 16),
              onTap: () {
                // ignore: deprecated_member_use
                launch('tel:+996555555555');
              },
            ),
            TripInfoListItem(
              prefixIcon: Icons.message,
              text: 'Написать',
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.blueGrey, size: 16),
              onTap: () {},
            ),
            TripInfoListItem(
              prefixIcon: Icons.flag,
              text: 'Пожаловаться',
              trailing: const Icon(Icons.arrow_forward_ios,
                  color: Colors.blueGrey, size: 16),
              onTap: () {},
              divider: false,
            ),
            Gap(size: 10),
          ],
        ),
      ),
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
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey.shade800),
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
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey.shade800),
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

// ignore: must_be_immutable
class TripInfoListItem extends StatelessWidget {
  IconData? prefixIcon;
  Widget? trailing;
  bool? divider;
  String text;
  VoidCallback? onTap;

  TripInfoListItem(
      {super.key,
      this.prefixIcon,
      required this.text,
      this.trailing,
      this.divider = true,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(size: 10),
        ListTile(
            onTap: onTap,
            leading: prefixIcon == null
                ? null
                : Icon(prefixIcon, color: Colors.blueGrey),
            title: Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.blueGrey.shade700),
            ),
            trailing: trailing),
        Gap(size: 10),
        if (divider!) const Divider(height: 1),
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
  Widget build(BuildContext context) {
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
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blueGrey.shade800),
                ),
                Gap(size: 5),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 16),
                    Gap(size: 5),
                    Text(userRating.toString(),
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey)),
                    const Text(' / ',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey)),
                    const Text('5',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey)),
                    const Text(' - ',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey)),
                    Text('$countOfReviews отзывов',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        )),
                  ],
                ),
              ],
            ),
            CircleAvatar(
              backgroundColor: Colors.blueGrey.shade100,
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
