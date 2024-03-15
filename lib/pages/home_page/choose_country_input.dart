import 'package:flutter/material.dart';
import 'package:migrant/providers/choose_country_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ChooseCountryInput extends StatefulWidget {
  VoidCallback? onTap;
  String? type;
  ChooseCountryInput({super.key, this.onTap, this.type});

  @override
  State<ChooseCountryInput> createState() => _ChooseCountryInputState();
}

class _ChooseCountryInputState extends State<ChooseCountryInput> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 52,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 12, right: 12),
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
            Text(
              widget.type == "start" &&
                      context
                              .watch<ChooseCountryProvider>()
                              .startCountry
                              .length >
                          2
                  ? context.watch<ChooseCountryProvider>().startCountry
                  : widget.type == "end" &&
                          context
                                  .watch<ChooseCountryProvider>()
                                  .endCountry
                                  .length >
                              2
                      ? context.watch<ChooseCountryProvider>().endCountry
                      : "Choose Country",
              style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

//   Future<void> _navigateAndDisplaySelection(BuildContext context) async {
//   //   final result = await Navigator.push(
//   //     context,
//   //     MaterialPageRoute(builder: (context) => const ChooseCountry()),
//   //   );

//   //   if (!context.mounted) return;

//   //   if (result != null) {
//   //     setState(() {
//   //       _startingCountryInfo = result;
//   //     });
//   //   }
//   // }
}
