import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:migrant/auth/login/index.dart';

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
                    const SizedBox(
                      height: 40,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
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
                        Navigator.pushNamed(context, '/home-page');
                      },
                      child: const Text('Send OTP',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
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
                const Text("You remember your password? "),
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
    );
  }
}
