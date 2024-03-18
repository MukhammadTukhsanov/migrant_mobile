import 'package:flutter/material.dart';
import 'package:migrant/components/gap.dart';

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
                    Gap(size: 20),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16.0),
                        labelText: 'Old Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Gap(size: 20),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16.0),
                        labelText: 'New Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Gap(size: 20),
                    TextField(
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16.0),
                        labelText: 'Confirm New Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    Gap(size: 20),
                    ElevatedButton(
                      onPressed: null,
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                          Size(MediaQuery.of(context).size.width, 50),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                      ),
                      child: const Text('Change Password',
                          style: TextStyle(
                            color: Colors.white,
                          )),
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
