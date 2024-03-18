import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:migrant/components/buttons.dart';
import 'package:migrant/components/gap.dart';

class VerifiyProfile extends StatefulWidget {
  const VerifiyProfile({super.key});

  @override
  State<VerifiyProfile> createState() => _VerifiyProfileState();
}

class _VerifiyProfileState extends State<VerifiyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Verify Profile"),
      ),
      backgroundColor: Colors.white,
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  "Verify Phone Number",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    color: Colors.blueGrey[700],
                  ),
                ),
                Gap(size: 16),
                Text(
                  "Code in sent to +49 123 456 789",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.blueGrey[700],
                  ),
                  textAlign: TextAlign.center,
                ),
                Gap(size: 16),
                // Timer

                Text(
                  "00:00",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                    color: Colors.blueGrey[700],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: const InputDecoration(
                                hintText: "-", border: InputBorder.none),
                            style: Theme.of(context).textTheme.titleLarge,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: const InputDecoration(
                                hintText: "-", border: InputBorder.none),
                            // ignore: deprecated_member_use
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: const InputDecoration(
                                hintText: "-", border: InputBorder.none),
                            // ignore: deprecated_member_use
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: TextFormField(
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            decoration: const InputDecoration(
                                hintText: "-", border: InputBorder.none),
                            // ignore: deprecated_member_use
                            style: Theme.of(context).textTheme.headline6,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(size: 16),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      text: "Don't received code? ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.blueGrey[700],
                      ),
                      children: [
                        TextSpan(
                          text: "Request again via sms",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(size: 16),
                FillButton(text: "Verify", onPress: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
