import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:migrant/providers/choose_country_provider.dart';
import 'package:provider/provider.dart';

class ChooseCountry extends StatefulWidget {
  String? type;
  ChooseCountry({super.key, this.type});

  @override
  State<ChooseCountry> createState() => _ChooseCountryState();
}

class _ChooseCountryState extends State<ChooseCountry> {
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Choose Country'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CSCPicker(
                layout: Layout.vertical,
                showStates: true,
                showCities: true,
                flagState: CountryFlag.DISABLE,
                dropdownDecoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                ),
                disabledDropdownDecoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.blueGrey.shade50,
                  border: Border.all(color: Colors.blueGrey),
                ),
                selectedItemStyle: TextStyle(
                  color: Colors.blueGrey.shade700,
                  fontSize: 14,
                ),
                dropdownHeadingStyle: TextStyle(
                  color: Colors.blueGrey.shade700,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                dropdownItemStyle: TextStyle(
                  color: Colors.blueGrey.shade700,
                  fontSize: 14,
                ),
                dropdownDialogRadius: 10.0,
                searchBarRadius: 10.0,
                onCountryChanged: (value) {
                  // ignore: unnecessary_null_comparison
                  if (value != null) {
                    setState(() {
                      countryValue = value;
                    });
                  }
                },
                onStateChanged: (value) {
                  if (value != null) {
                    setState(() {
                      stateValue = value;
                    });
                  }
                },
                onCityChanged: (value) {
                  if (value != null) {
                    setState(() {
                      cityValue = value;
                    });
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              // button on tap go to back with data
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width - 32, 50),
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.white, width: 1),
                  ),
                ),
                onPressed: () {
                  widget.type == "start"
                      ? Provider.of<ChooseCountryProvider>(context,
                              listen: false)
                          .setStartingCountry(
                              "$countryValue $stateValue $cityValue")
                      : widget.type == "end"
                          ? Provider.of<ChooseCountryProvider>(context,
                                  listen: false)
                              .setEndingCountry(
                                  "$countryValue $stateValue $cityValue")
                          : null;
                  Navigator.pop(context);
                  //   countryValue,
                  //   stateValue,
                  //   cityValue,
                  // ]);
                },
                child: const Text("Save",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.2)),
              ),
            ],
          ),
        ));
  }
}
