import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

class ChooseCountry extends StatefulWidget {
  const ChooseCountry({super.key, required startCountry, required endCountry});

  @override
  State<ChooseCountry> createState() => _ChooseCountryState();
}

class _ChooseCountryState extends State<ChooseCountry> {
  bool startCountry = false;
  bool endCountry = false;

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
                  color: Colors.grey.shade300,
                  border: Border.all(color: Colors.grey),
                ),
                selectedItemStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                dropdownHeadingStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
                dropdownItemStyle: const TextStyle(
                  color: Colors.black,
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
              // button on tap go to back with data
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, [
                    countryValue,
                    stateValue,
                    cityValue,
                    startCountry,
                    endCountry
                  ]);
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ));
  }
}
