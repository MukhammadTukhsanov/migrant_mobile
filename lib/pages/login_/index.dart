import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:migrant/pages/forget_password_/index.dart';
import 'package:migrant/pages/registration_/index.dart';
import 'package:migrant/components/buttons.dart' as buttons;
import 'package:migrant/components/devider.dart';
import 'package:migrant/components/gap.dart';
import 'package:migrant/components/outlined_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //controller for email input
  final _emailController = TextEditingController();
  //controller for password input
  final _passwordController = TextEditingController();
  //password visibility
  bool _obscureText = true;

  // dispose controllers
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          Expanded(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      labelText: 'Email',
                      prefixIcon: Icons.email_outlined,
                    ),
                    Gap(size: 20),
                    InputOutlined(
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
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: buttons.TextButton(
                          text: "Forgot Password?",
                          onPress: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => const ForgetPassword(),
                                ));
                          }),
                    ),
                    Gap(size: 20),
                    buttons.FillButton(text: "Login", onPress: () {}),
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
                                border:
                                    Border.all(color: Colors.blueGrey.shade300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage(
                                          'assets/images/google.png'),
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      'Google',
                                      style: TextStyle(color: Colors.blueGrey),
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

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await _auth.signInWithCredential(credential);

        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, '/navigation');
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
