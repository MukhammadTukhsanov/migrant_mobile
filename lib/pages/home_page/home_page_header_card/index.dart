import 'package:flutter/material.dart';
import 'package:migrant/components/date_picker.dart';
import 'package:migrant/components/gap.dart';
import 'package:migrant/pages/choose_country/index.dart';
import 'package:migrant/pages/home_page/choose_country_input.dart';
import 'package:migrant/pages/home_page/seat_picker/index.dart';

//ignore: must_be_immutable
class HomePageHeader extends StatelessWidget {
  String? type;

  HomePageHeader({super.key, this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Colors.blueGrey,
              width: 1,
            ),
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ChooseCountryInput(
                  type: "start",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChooseCountry(type: "start")),
                    );
                  },
                ),
                Gap(size: 16),
                ChooseCountryInput(
                  type: "end",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChooseCountry(type: "end")),
                    );
                  },
                ),
                Gap(size: 16),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8 - 48,
                        height: 50,
                        child: const DatePicker(),
                      ),
                    ),
                    Gap(size: 8),
                    const SeatPicker()
                  ],
                ),
              ],
            )));
  }
}
