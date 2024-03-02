import 'package:flutter/material.dart';
import 'package:migrant/components/date_picker.dart';
import 'package:migrant/pages/choose_country.dart';

// ignore: must_be_immutable
class SearchTopModal extends StatefulWidget {
  SearchTopModal({super.key, required this.onConfirm});

  @override
  State<SearchTopModal> createState() => _SearchTopModalState();
  VoidCallback onConfirm;
}

class _SearchTopModalState extends State<SearchTopModal> {
  List<dynamic> _startingCountryInfo = [];
  final List<dynamic> _endingCountryInfo = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  _navigateAndDisplaySelection(context, true, false);
                  // Navigator.of(context).push(_createRoute());
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        child: Text(
                          _startingCountryInfo.isEmpty
                              ? "Choose Country"
                              : "${_startingCountryInfo[1].length > 1 ? _startingCountryInfo[0] + "," : _startingCountryInfo[0]}  ${_startingCountryInfo[2].length > 1 ? _startingCountryInfo[1] + "," : _startingCountryInfo[1]} ${_startingCountryInfo[2]}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.blueGrey),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  _navigateAndDisplaySelection(context, false, true);
                  // Navigator.of(context).push(_createRoute());
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.blueGrey),
                      const SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        child: Text(
                          _endingCountryInfo.isEmpty
                              ? "Choose Country"
                              : "${_endingCountryInfo[1].length > 1 ? _endingCountryInfo[0] + "," : _endingCountryInfo[0]}  ${_endingCountryInfo[2].length > 1 ? _endingCountryInfo[1] + "," : _endingCountryInfo[1]} ${_endingCountryInfo[2]}",
                          style: const TextStyle(
                              fontSize: 18, color: Colors.blueGrey),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  //date box

                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8 - 48,
                    height: 50,
                    child: const DatePicker(),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  //passanger count box
                  Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      // padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.blueGrey),
                          borderRadius: BorderRadius.circular(4)),
                      child: const TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.airline_seat_recline_extra_rounded,
                            color: Colors.blueGrey,
                          ),
                          contentPadding: EdgeInsets.all(9),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          // labelText: '1',
                          hintStyle:
                              TextStyle(fontSize: 18, color: Colors.blueGrey),
                          hintText: '1',
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  widget.onConfirm();
                },
                // onTap: () {
                //   // Navigator.pop(context);
                // },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(4)),
                  child: const Center(
                    child: Text(
                      "Confirm",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _navigateAndDisplaySelection(
      BuildContext context, stratCountry, endCountry) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ChooseCountry(
              startCountry: stratCountry, endCountry: endCountry)),
    );

    if (!context.mounted) return;

    if (result != null) {
      if (stratCountry) {
        setState(() {
          _startingCountryInfo = result;
        });
      }
      if (endCountry) {
        setState(() {
          _endingCountryInfo.addAll(result);
        });
      }
      // print(_startingCountryInfo["country"]);
    }
  }

  // Route _createRoute() {
  //   return PageRouteBuilder(
  //     pageBuilder: (context, animation, secondaryAnimation) =>
  //         const ChooseCountry(),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       const begin = Offset(0.0, 1.0);
  //       const end = Offset.zero;
  //       const curve = Curves.ease;

  //       var tween =
  //           Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  //       return SlideTransition(
  //         position: animation.drive(tween),
  //         child: child,
  //       );
  //     },
  //   );
  // }
}
