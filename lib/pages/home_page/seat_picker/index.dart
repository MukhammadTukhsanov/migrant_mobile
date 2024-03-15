import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeatPicker extends StatefulWidget {
  const SeatPicker({super.key});

  @override
  State<SeatPicker> createState() => _SeatPickerState();
}

class _SeatPickerState extends State<SeatPicker> {
  late String _freeSeatCount = "1";
  final children = [
    const Text("1"),
    const Text("2"),
    const Text("3"),
    const Text("4"),
    const Text("5"),
    const Text("6"),
    const Text("7"),
    const Text("8"),
    const Text("9"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.blueGrey),
          borderRadius: BorderRadius.circular(4)),
      child: SizedBox(
        //border
        height: 50,
        child: CupertinoButton(
            child: Row(
              children: [
                const Icon(Icons.airline_seat_recline_extra_rounded,
                    color: Colors.blueGrey),
                const SizedBox(width: 8),
                Text(_freeSeatCount,
                    style: const TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
              ],
            ),
            onPressed: () => showCupertinoModalPopup(
                context: context,
                builder: (_) => SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: CupertinoPicker(
                        backgroundColor: Colors.white,
                        itemExtent: 30,
                        scrollController: FixedExtentScrollController(
                          initialItem: int.parse(_freeSeatCount) - 1,
                        ),
                        onSelectedItemChanged: (int value) {
                          setState(() {
                            _freeSeatCount = children[value].data.toString();
                          });
                        },
                        children: children,
                      ),
                    ))),
      ),
    );
  }
}
