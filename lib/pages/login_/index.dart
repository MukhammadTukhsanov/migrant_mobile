import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:migrant/auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:migrant/pages/forget_password_/index.dart';
import 'package:migrant/pages/registration_/index.dart';
import 'package:migrant/components/buttons.dart' as buttons;
import 'package:migrant/components/devider.dart';
import 'package:migrant/components/gap.dart';
import 'package:migrant/components/input_outlined.dart';
import 'package:migrant/pages/welcom/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controller for email input
  final _emailController = TextEditingController(
    text: 'passanger@mail.com',
  );
  //controller for password input
  final _passwordController = TextEditingController(
    text: '123456',
  );
  //password visibility
  bool _obscureText = true;

  bool isErrEmailOrPassword = false;

  // dispose controllers
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  errEmailOrPassword() {
    setState(() {
      isErrEmailOrPassword = true;
    });
    // delay
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isErrEmailOrPassword = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

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
      }
      return null; // Return null if the input is valid
    }

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   scrolledUnderElevation: BorderSide.strokeAlignCenter,
      //   backgroundColor: Colors.white,
      //   title: const Text('Login', style: TextStyle()),
      // ),
      // login page
      body: Column(
        children: [
          // error message
          Expanded(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      // error message
                      if (!isErrEmailOrPassword)
                        const SizedBox(height: 40)
                      else if (isErrEmailOrPassword)
                        Container(
                          height: 40,
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                              color: Colors.red.shade50,
                              border: Border.all(width: 2, color: Colors.red),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            children: [
                              const Icon(Icons.info_outline,
                                  color: Colors.red, size: 20),
                              Gap(size: 8),
                              const Text(
                                "Email or password is incorrect",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      Text("Sign In",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.blueGrey.shade700,
                              fontWeight: FontWeight.bold)),
                      Text("Enter valid email and password to continue",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.blueGrey.shade500,
                              fontWeight: FontWeight.w300)),
                      Gap(size: 40),

                      InputOutlined(
                        validator: checkValidateToEmail,
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        labelText: 'Email',
                        prefixIcon: Icons.email_outlined,
                      ),
                      Gap(size: 20),
                      InputOutlined(
                        validator: checkValidateToPassword,
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        labelText: 'Password',
                        prefixIcon: Icons.lock_outline,
                        obscureText: _obscureText,
                        suffixIcon: IconButton(
                          icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.blueGrey.shade400),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      Gap(size: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: buttons.TextButton(
                            text: "Forgot Password?",
                            onPress: () {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                    builder: (context) =>
                                        const ForgetPassword(),
                                  ));
                            }),
                      ),
                      Gap(size: 20),
                      buttons.FillButton(
                        text: "Login",
                        onPress: _signIn,
                      ),
                      Gap(size: 20),
                      // or login with text with devider
                      MyDevider(text: "Or Continue With"),
                      Gap(size: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.shade50,
                                border:
                                    Border.all(color: Colors.blueGrey.shade300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Image(
                                      image: AssetImage(
                                          'assets/images/facebook.png'),
                                      width: 20,
                                    ),
                                    Gap(size: 16),
                                    const Text(
                                      'Facebook',
                                      style: TextStyle(color: Colors.blueGrey),
                                    ),
                                  ]),
                            ),
                          ),
                          Gap(size: 20),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                _signInWithGoogle();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey.shade50,
                                  border: Border.all(
                                      color: Colors.blueGrey.shade300),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Image(
                                        image: AssetImage(
                                            'assets/images/google.png'),
                                        width: 20,
                                      ),
                                      Gap(size: 16),
                                      const Text(
                                        'Google',
                                        style:
                                            TextStyle(color: Colors.blueGrey),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? ",
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w400,
                        fontSize: 16)),
                buttons.TextButton(
                    text: "Sign Up",
                    onPress: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const RegistrationPage()));
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }

  _signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        // await _auth.signInWithCredential(credential);

        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, '/navigation');
      }
    } catch (e) {
      errEmailOrPassword();
      // ignore: avoid_print
      print("error: $e");
    }
  }

  void _signIn() async {
    if (kDebugMode) {
      print(
          "email: ${_emailController.text} password: ${_passwordController.text}");
    }
    User? user = await FirebaseAuthServices.signInUsingEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
        context: context);
    if (user != null) {
      // ignore: use_build_context_synchronously
      FirebaseAuthServices.getUserData(uid: user.uid, context: context);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const WelcomePage()));
    } else {
      errEmailOrPassword();
    }
  }
}
