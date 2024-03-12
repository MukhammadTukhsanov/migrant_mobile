import 'package:flutter/material.dart';
import 'package:migrant/components/date_picker.dart';
import 'package:migrant/pages/choose_country_page.dart';
import 'package:migrant/pages/home_page/choose_country_input.dart';
import 'package:migrant/providers/choose_country_provider.dart';
import 'package:provider/provider.dart';

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
                Expanded(
                    child: ChooseCountryInput(
                  type: "start",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChooseCountry(type: "start")),
                    );
                  },
                )),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                    child: ChooseCountryInput(
                  type: "end",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChooseCountry(type: "end")),
                    );
                  },
                )),
                const SizedBox(height: 16),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8 - 48,
                          height: 50,
                          child: const DatePicker(),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: Colors.blueGrey),
                              borderRadius: BorderRadius.circular(4)),
                          child: const TextField(
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontSize: 16, color: Colors.blueGrey),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.airline_seat_recline_extra_rounded,
                                color: Colors.blueGrey,
                              ),
                              contentPadding: EdgeInsets.all(9),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              // labelText: '1',
                              hintStyle: TextStyle(
                                  fontSize: 18, color: Colors.blueGrey),
                              hintText: '1',
                            ),
                          ))
                    ],
                  ),
                )
              ],
            )));
  }
}
