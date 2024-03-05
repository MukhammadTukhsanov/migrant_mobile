// ignore_for_file: unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:migrant/auth/login/index.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // controller first name
  final _firstNameController = TextEditingController();
  // controller last name
  final _lastNameController = TextEditingController();
  // controller email
  final _emailController = TextEditingController();
  // controller password
  final _passwordController = TextEditingController();
  // controller confirm password
  final _confirmPasswordController = TextEditingController();
  // obsecure text
  bool _passwordObscureText = true;
  // obsecure text consfirm paswword
  bool _confirmPasswordObscureText = true;

  final _registrationPageInputs = [
    {
      'label': 'First Name',
      'controller': TextEditingController(),
      'prefixIcon': Icons.person,
      'suffixIcon': Icons.clear,
      'keyboardType': TextInputType.name,
    },
    {
      'label': 'Last Name',
      'controller': TextEditingController(),
      'prefixIcon': Icons.person,
      'suffixIcon': Icons.clear,
      'keyboardType': TextInputType.name,
    },
    {
      'label': 'Email',
      'controller': TextEditingController(),
      'prefixIcon': Icons.email,
      'suffixIcon': Icons.clear,
      'keyboardType': TextInputType.emailAddress,
    },
    {
      'label': 'Password',
      'type': 'password',
      'controller': TextEditingController(),
      'prefixIcon': Icons.lock,
      'suffixIcon': Icons.remove_red_eye_outlined,
      'keyboardType': TextInputType.visiblePassword,
    },
    {
      'type': 'confirmPassword',
      'label': 'Confirm Password',
      'controller': TextEditingController(),
      'prefixIcon': Icons.lock,
      'suffixIcon': Icons.remove_red_eye_outlined,
      'keyboardType': TextInputType.visiblePassword,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // registration page
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: BorderSide.strokeAlignCenter,
          backgroundColor: Colors.white,
          // title: const Text(
          // 'Registration',
          // style: TextStyle(color: Colors.black),
          // ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // title for registration page
                        Text("Sign Up",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.blueGrey.shade700,
                                fontWeight: FontWeight.bold)),
                        Text("Use the account you created to sign in to Gmail",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.blueGrey.shade500,
                                fontWeight: FontWeight.w300)),
                        const SizedBox(
                          height: 40,
                        ),
                        // map inputs from _registration_page_inputs
                        for (var input in _registrationPageInputs)
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: TextField(
                              controller:
                                  input['controller'] as TextEditingController?,
                              keyboardType:
                                  input['keyboardType'] as TextInputType,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                        color: Colors.blueGrey, width: .5)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                        color: Colors.blueGrey, width: 1)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                      color: Colors.blueGrey, width: .5),
                                ),
                                contentPadding: const EdgeInsets.all(16.0),
                                labelText: input['label'] as String,
                                labelStyle: const TextStyle(
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.w400),
                                // input cleare button
                                prefixIcon: Icon(
                                    input['prefixIcon'] as IconData?,
                                    size: 20,
                                    color: Colors.blueGrey.shade400),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    if (input['type'] == 'password') {
                                      setState(() {
                                        _passwordObscureText =
                                            !_passwordObscureText;
                                      });
                                    } else if (input['type'] ==
                                        'confirmPassword') {
                                      setState(() {
                                        _confirmPasswordObscureText =
                                            !_confirmPasswordObscureText;
                                      });
                                    } else {
                                      (input['controller']
                                              as TextEditingController)
                                          .clear();
                                    }
                                  },
                                  icon: Icon(input['suffixIcon'] as IconData?,
                                      size: 20,
                                      color: Colors.blueGrey.shade400),
                                ),
                              ),
                              obscureText: input['type'] == 'password'
                                  ? _passwordObscureText
                                  : input['type'] == 'confirmPassword'
                                      ? _confirmPasswordObscureText
                                      : false,
                            ),
                          ),
                        const SizedBox(
                          height: 20,
                        ),

                        // To sign up {Gmail}, create a {Google Account}. You can use the username and password to {sign}.
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            text: 'To sign up ',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Gmail',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: ', create a ',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'Google Account',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text:
                                    '. You can use the username and password to ',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: 'sign',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                              Size(MediaQuery.of(context).size.width, 50),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.all(16),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              Colors.blueGrey,
                            ),
                          ),
                          child: const Text('Create Account',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const LoginPage()));
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
