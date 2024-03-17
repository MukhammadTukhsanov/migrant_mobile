import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyDevider extends StatelessWidget {
  String? text;
  MyDevider({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return text == null
        ? Divider(
            color: Colors.blueGrey.shade300,
            thickness: 1,
          )
        : Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.blueGrey.shade300,
                  thickness: 1,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text!,
                    style: const TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  )),
              Expanded(
                child: Divider(
                  color: Colors.blueGrey.shade300,
                  thickness: 1,
                ),
              ),
            ],
          );
  }
}
