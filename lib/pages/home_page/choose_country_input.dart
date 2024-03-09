// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:migrant/pages/choose_country_page.dart';

class ChooseCountryInput extends StatefulWidget {
  const ChooseCountryInput({super.key});

  @override
  State<ChooseCountryInput> createState() => _ChooseCountryInputState();
}

class _ChooseCountryInputState extends State<ChooseCountryInput> {
  List<dynamic> _startingCountryInfo = [];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigateAndDisplaySelection(context);
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
            // icon location_on and text Choose Country
            const Icon(
              Icons.location_on,
              color: Colors.blueGrey,
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: Text(
                _startingCountryInfo.isEmpty || _startingCountryInfo[0] == ""
                    ? "Choose Country"
                    : "${_startingCountryInfo[1].length > 1 ? _startingCountryInfo[0] + "," : _startingCountryInfo[0]}  ${_startingCountryInfo[2].length > 1 ? _startingCountryInfo[1] + "," : _startingCountryInfo[1]} ${_startingCountryInfo[2]}",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(fontSize: 18, color: Colors.blueGrey),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChooseCountry()),
    );

    if (!context.mounted) return;

    if (result != null) {
      setState(() {
        _startingCountryInfo = result;
      });
    }
  }
}
