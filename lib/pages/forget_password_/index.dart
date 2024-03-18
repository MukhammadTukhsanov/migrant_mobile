import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:migrant/components/gap.dart';
import 'package:migrant/components/input_outlined.dart';
import 'package:migrant/pages/login_/index.dart';
import 'package:migrant/components/buttons.dart' as buttons;

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('', style: TextStyle()),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("Forget Password",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.blueGrey.shade700,
                            fontWeight: FontWeight.bold)),
                    Text(
                        'Change your Password. Open your Google Account. You might need to sign in. Under  "Security" ',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.blueGrey.shade500,
                            fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center),
                    Gap(size: 40),
                    InputOutlined(
                      labelText: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icons.email_outlined,
                    ),
                    Gap(size: 20),
                    buttons.FillButton(
                      text: 'Send',
                      onPress: () {},
                    )
                  ],
                ),
              ),
            ),
          )),
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("You remember your password? ",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey.shade500,
                        fontWeight: FontWeight.w300)),
                buttons.TextButton(
                  text: 'Sign In',
                  onPress: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
