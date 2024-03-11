import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:migrant/auth/forgot_password/index.dart';
import 'package:migrant/auth/registration/index.dart';

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
                    const SizedBox(
                      height: 40,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(
                                color: Colors.blueGrey, width: .5)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                                color: Colors.blueGrey.shade900, width: 1)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(
                              color: Colors.blueGrey, width: .5),
                        ),
                        contentPadding: const EdgeInsets.all(16.0),
                        labelText: 'Email',
                        labelStyle: const TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w400),
                        prefixIcon: Icon(Icons.email_outlined,
                            size: 20, color: Colors.blueGrey.shade400),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: _passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: const BorderSide(
                                color: Colors.blueGrey, width: .5)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                                color: Colors.blueGrey.shade900, width: 1)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: const BorderSide(
                              color: Colors.blueGrey, width: .5),
                        ),
                        contentPadding: const EdgeInsets.all(16.0),
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w400),
                        prefixIcon: Icon(Icons.lock_outline,
                            size: 20, color: Colors.blueGrey.shade400),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(Icons.remove_red_eye_outlined,
                              size: 20, color: Colors.blueGrey.shade400),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const ForgetPassword(),
                              ));
                        },
                        child: const Text(
                          'Forget Password?',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                          Size(MediaQuery.of(context).size.width, 50),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueGrey),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/navigation');
                      },
                      child: const Text('Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // or login with text with devider
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.blueGrey.shade300,
                            thickness: 1,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Or Continue With',
                            style: TextStyle(
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.blueGrey.shade300,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
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
                            child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage(
                                        'assets/images/facebook.png'),
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    'Facebook',
                                    style: TextStyle(color: Colors.blueGrey),
                                  ),
                                ]),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
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
                const Text("Don't have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const RegistrationPage(),
                        ));
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _signIn() async {
    // ignore: avoid_print
    print("Clicked");
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = (await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    ))
        .user;

    if (user != null) {
      // user created
      // navigate to home page
      // ignore: avoid_print
      print("User is successfully signed in!");
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, '/navigation');
    } else {
      // user not created
      // show error message
      // ignore: duplicate_ignore
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error creating user'),
        ),
      );
    }
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
