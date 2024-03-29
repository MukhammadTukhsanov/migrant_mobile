import 'package:flutter/material.dart';
import 'package:migrant/components/buttons.dart';
import 'package:migrant/components/gap.dart';
import 'package:migrant/components/input_outlined.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Change Password', style: TextStyle()),
        ),
        // change password page
        body: Column(
          children: [
            Container(
              width: double.infinity,
              // height: MediaQuery.of(context).size.height * 0.7,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Gap(size: 10),
                    InputOutlined(
                      labelText: 'Old Password',
                    ),
                    Gap(size: 10),
                    InputOutlined(
                      labelText: 'New Password',
                    ),
                    Gap(size: 10),
                    InputOutlined(
                      labelText: 'Confirm Password',
                    ),
                    Gap(size: 20),
                    FillButton(
                      onPress: () {},
                      text: 'Change Password',
                    ),
                    Gap(size: 30),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
