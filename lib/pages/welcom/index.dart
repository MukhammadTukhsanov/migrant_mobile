import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:migrant/components/gap.dart';
import 'package:migrant/pages/login_/index.dart';
import 'package:migrant/pages/registration_/index.dart';
import 'package:migrant/navbar/index.dart';
import 'package:migrant/providers/user_reg_provider.dart';
import 'package:provider/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/welcome.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            child: Column(
                children: <Widget>[
              Gap(size: MediaQuery.of(context).size.height / 2),
              // image assets/images/welcomeLogo
              const Image(
                  image: AssetImage("assets/images/welcomeLogo.png"),
                  width: 250),
              Gap(size: 20),
              ElevatedButton(
                // outline button
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width - 32, 50),
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.white, width: 1),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Gap(size: 20),
              ElevatedButton(
                // outline button
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width - 32, 50),
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.white, width: 1),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const RegistrationPage(),
                      ));
                },
                child: const Text(
                  'Registration',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Gap(size: 20),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.blueGrey.shade300,
                      thickness: 1,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.circle_outlined,
                          color: Colors.blueGrey.shade300)),
                  Expanded(
                    child: Divider(
                      color: Colors.blueGrey.shade300,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              Gap(size: 20),
              ElevatedButton(
                // outline button
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width - 32, 50),
                  backgroundColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.white, width: 1),
                  ),
                ),
                onPressed: () {
                  context.read<UserRegProvider>().skipLogin();
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const Navigation(),
                      ));
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ]
                    .animate(
                      interval: .1.seconds,
                    )
                    .fade()
                    .slideX(
                      delay: .2.seconds,
                      begin: 4,
                      duration: 1.seconds,
                      end: 0,
                    )),
          ),
        ).animate().fade().slideY(
              begin: 0.5,
              end: 0,
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 800),
            ));
  }
}
