import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:migrant/auth/auth_components/button.dart';
import 'package:migrant/auth/firebase_implementation/firebase_uth_services.dart';
import 'package:migrant/auth/login/index.dart';
import 'package:migrant/auth/auth_components/header.dart';
import 'package:migrant/auth/registration/inputs_controller.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // firebase authentication service
  final FirebaseAuthService _auth = FirebaseAuthService();

  // text controllers
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final bool _passwordObscureText = true;
  final bool _confirmPasswordObscureText = true;

  // form key
  final _formKey = GlobalKey<FormState>();

  // firebase firestore collection reference
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
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
                          const SizedBox(
                            height: 40,
                          ),
                          // map inputs from _registration_page_inputs

                          RegistrationPageInputs(
                            firstNameController: _firstnameController,
                            lastNameController: _lastnameController,
                            emailController: _emailController,
                            passwordController: _passwordController,
                            confirmPasswordController:
                                _confirmPasswordController,
                            passwordObscureText: _passwordObscureText,
                            confirmPasswordObscureText:
                                _confirmPasswordObscureText,
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
                          AuthPagesBtn(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _signUp();
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
          ),
        ));
  }

  void _signUp() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    // ignore: avoid_print
    print("Email: $email");
    // ignore: avoid_print
    print("Password: $password");
    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      await addUser(
        _firstnameController.text.trim(),
        _lastnameController.text.trim(),
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );
      print("user ${_auth.getCurrentUser()}");

      // ignore: avoid_print
      print("User is successfully created");
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/navigation');
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error creating user'),
        ),
      );
    }
  }

  Future<void> addUser(
      String firstName, String lastName, String email, String password) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'password': password
        })
        // ignore: avoid_print
        .then((value) => print("value ${value.id}"))
        // ignore: avoid_print
        .catchError((error) => print("Failed to add user: $error"));
  }
}
