import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:migrant/auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:migrant/components/buttons.dart' as button;
import 'package:migrant/components/gap.dart';
import 'package:migrant/components/input_outlined.dart';
import 'package:migrant/navbar/index.dart';
import 'package:migrant/pages/login_/index.dart';
import 'package:migrant/auth/auth_components/header.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // firebase authentication service

  // text controllers
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  bool _passwordObscureText = true;
  bool _confirmPasswordObscureText = true;
  bool _isDriver = false;
  bool _isPassenger = false;
  bool unchecked = false;

  // form key
  final _formKey = GlobalKey<FormState>();

  // firebase firestore collection reference
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    checkValidateToEmpty(String? value) {
      if (value!.isEmpty) {
        return 'Please enter your first name';
      }
    }

    checkValidateToEmail(String? value) {
      if (value!.isEmpty) {
        return 'Please enter an email address';
      } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
          .hasMatch(value)) {
        return 'Please enter a valid email address';
      }
      return null; // Return null if the input is valid
    }

    checkValidateToPassword(String? value) {
      if (value!.isEmpty) {
        return 'Please enter a password';
      } else if (value.length < 6) {
        return 'Password must be at least 6 characters long';
      } else if (_passwordController.text != _confirmPasswordController.text) {
        return 'Passwords do not match';
      }
      return null; // Return null if the input is valid
    }

    // registration page
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: BorderSide.strokeAlignCenter,
          backgroundColor: Colors.white,
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
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          // title for registration page
                          AuthPagesHeader(
                            title: 'Sign Up',
                            subTitle:
                                'Use the account you created to sign in to Gmail',
                          ),
                          Gap(size: 40),
                          // map inputs from _registration_page_inputs
                          InputOutlined(
                              validator: checkValidateToEmpty,
                              keyboardType: TextInputType.emailAddress,
                              controller: _firstnameController,
                              labelText: 'First Name',
                              prefixIcon: Icons.person,
                              suffixIcon: IconButton(
                                onPressed: () => _firstnameController.clear(),
                                icon: Icon(
                                  Icons.clear,
                                  size: 20,
                                  color: Colors.blueGrey.shade400,
                                ),
                              )),
                          Gap(size: 20),
                          InputOutlined(
                              validator: checkValidateToEmpty,
                              keyboardType: TextInputType.emailAddress,
                              controller: _lastnameController,
                              labelText: 'Last Name',
                              prefixIcon: Icons.person,
                              suffixIcon: IconButton(
                                onPressed: () => _lastnameController.clear(),
                                icon: Icon(
                                  Icons.clear,
                                  size: 20,
                                  color: Colors.blueGrey.shade400,
                                ),
                              )),

                          Gap(size: 20),
                          InputOutlined(
                              validator: checkValidateToEmail,
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                              labelText: 'Email',
                              prefixIcon: Icons.email,
                              suffixIcon: IconButton(
                                onPressed: () => _emailController.clear(),
                                icon: Icon(
                                  Icons.clear,
                                  size: 20,
                                  color: Colors.blueGrey.shade400,
                                ),
                              )),
                          // phone number
                          Gap(size: 20),
                          InputOutlined(
                              validator: checkValidateToEmpty,
                              keyboardType: TextInputType.phone,
                              controller: _phoneNumberController,
                              labelText: 'Phone Number',
                              prefixIcon: Icons.phone,
                              suffixIcon: IconButton(
                                onPressed: () => _emailController.clear(),
                                icon: Icon(
                                  Icons.clear,
                                  size: 20,
                                  color: Colors.blueGrey.shade400,
                                ),
                              )),

                          Gap(size: 20),
                          // checkbox driver or passenger
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Checkbox(
                                          activeColor: Colors.blueGrey,
                                          side: const BorderSide(
                                              color: Colors.blueGrey, width: 1),
                                          value: _isDriver,
                                          onChanged: (value) {
                                            setState(() {
                                              _isDriver = true;
                                              _isPassenger = false;
                                            });
                                          },
                                        ),
                                      ),
                                      Gap(size: 8),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.directions_car,
                                            color: Colors.blueGrey,
                                          ),
                                          Gap(size: 4),
                                          const Text(
                                            'Driver',
                                            style: TextStyle(
                                              color: Colors.blueGrey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: Checkbox(
                                            activeColor: Colors.blueGrey,
                                            side: const BorderSide(
                                                color: Colors.blueGrey,
                                                width: 1),
                                            value: _isPassenger,
                                            onChanged: (value) {
                                              setState(() {
                                                _isPassenger = true;
                                                _isDriver = false;
                                              });
                                            },
                                          ),
                                        ),
                                        Gap(size: 8),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.hail_sharp,
                                              color: Colors.blueGrey,
                                            ),
                                            Gap(size: 4),
                                            const Text(
                                              'Passenger',
                                              style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              if (unchecked)
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 16, top: 8),
                                    child: Text(
                                      "Please choose one",
                                      style: TextStyle(
                                        color: Colors.red.shade900,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Gap(size: 20),
                          InputOutlined(
                              validator: checkValidateToPassword,
                              keyboardType: TextInputType.visiblePassword,
                              controller: _passwordController,
                              labelText: 'Password',
                              obscureText: _passwordObscureText,
                              prefixIcon: Icons.lock,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _passwordObscureText =
                                        !_passwordObscureText;
                                  });
                                },
                                icon: Icon(
                                  _passwordObscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  size: 20,
                                  color: Colors.blueGrey.shade400,
                                ),
                              )),
                          Gap(size: 20),
                          InputOutlined(
                              validator: checkValidateToPassword,
                              keyboardType: TextInputType.visiblePassword,
                              controller: _confirmPasswordController,
                              labelText: 'Confirm Password',
                              obscureText: _confirmPasswordObscureText,
                              prefixIcon: Icons.lock,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _confirmPasswordObscureText =
                                        !_confirmPasswordObscureText;
                                  });
                                },
                                icon: Icon(
                                  _confirmPasswordObscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  size: 20,
                                  color: Colors.blueGrey.shade400,
                                ),
                              )),
                          Gap(size: 20),
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
                                    color: Colors.blueGrey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
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
                                    color: Colors.blueGrey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
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
                                    color: Colors.blueGrey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Gap(size: 20),
                          // sign up button
                          button.FillButton(
                            text: "Create Account",
                            onPress: () {
                              if (_isDriver == false && _isPassenger == false) {
                                setState(() {
                                  unchecked = true;
                                });
                              } else {
                                setState(() {
                                  unchecked = false;
                                });
                              }
                              if (_formKey.currentState!.validate() &&
                                  !unchecked) {
                                _createAccount();
                              }
                            },
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
                    const Text("Already have an account? ",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => const LoginPage()));
                      },
                      child: button.TextButton(
                        onPress: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const LoginPage()));
                        },
                        text: "Sign In",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  void _createAccount() async {
    User? user = await FirebaseAuthServices.createNewUserAccount(
        firstName: _firstnameController.text.trim(),
        lastName: _lastnameController.text.trim(),
        email: _emailController.text.trim(),
        phoneNumber: _phoneNumberController.text.trim(),
        isDriver: bool.parse(_isDriver.toString()),
        password: _passwordController.text.trim(),
        navigator: Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Navigation())),
        context: context);
    if (kDebugMode) {
      print("user: $user");
    }
  }
}
