import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:migrant/auth/login/index.dart';
import 'package:migrant/profile_page/advertisement/add_advertisement.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: AnnotatedRegion(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.black,
              statusBarIconBrightness: Brightness.light,
            ),
            child: Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                        height: 320,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              child: Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  color: Colors.blueGrey,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width - 32,
                                    height: 210,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          bottom: 0,
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  32,
                                              height: 160,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.blueGrey,
                                                    spreadRadius: 0,
                                                    blurRadius: 4,
                                                    offset: Offset(0, 0),
                                                  ),
                                                ],
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              )),
                                        ),
                                        const Positioned(
                                          top: 0,
                                          left: 0,
                                          right: 0,
                                          child: Center(
                                            child: CircleAvatar(
                                              radius: 50,
                                              backgroundImage: NetworkImage(
                                                  'https://mighty.tools/mockmind-api/content/human/6.jpg'),
                                            ),
                                          ),
                                        ),
                                        const Positioned(
                                          top: 0,
                                          left: 0,
                                          right: 0,
                                          child: Center(
                                            child: Column(children: [
                                              SizedBox(
                                                height: 110,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Theresa Schröder',
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  // verified user
                                                  SizedBox(
                                                    width: 6,
                                                  ),
                                                  Icon(
                                                    Icons.verified,
                                                    color: Colors.blueGrey,
                                                    size: 18,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    color: Colors.grey,
                                                    size: 18,
                                                  ),
                                                  SizedBox(
                                                    width: 6,
                                                  ),
                                                  Text(
                                                    'Berlin, Germany',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  // verified user
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  // user type passenger with icon
                                                  Icon(
                                                    Icons.hail_sharp,
                                                    color: Colors.blueGrey,
                                                    size: 18,
                                                  ),
                                                  SizedBox(
                                                    width: 6,
                                                  ),
                                                  Text("Passanger",
                                                      style: TextStyle(
                                                        color: Colors.blueGrey,
                                                      )),
                                                  SizedBox(
                                                    width: 6,
                                                  ),

                                                  SizedBox(
                                                    width: 6,
                                                  ),
                                                  // user rayting
                                                  Icon(
                                                    Icons.star,
                                                    color: Colors.blueGrey,
                                                    size: 18,
                                                  ),
                                                  SizedBox(
                                                    width: 6,
                                                  ),
                                                  Text("4.5",
                                                      style: TextStyle(
                                                        color: Colors.blueGrey,
                                                      )),
                                                ],
                                              )
                                            ]),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 32,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey,
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            // user phone nummber
                            ListTile(
                              onTap: () {
                                // ignore: deprecated_member_use
                                launch("tel://+49123456789");
                              },
                              leading: const Icon(
                                Icons.phone,
                                color: Colors.blueGrey,
                              ),
                              title: const Text(
                                'Phone number',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                              ),
                              subtitle: const Text(
                                '+49 123 456 789',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                            // user email
                            ListTile(
                              onTap: () {
                                // ignore: deprecated_member_use
                                launch("mailto: theresa89@domain.ltd");
                              },
                              leading: const Icon(
                                Icons.email,
                                color: Colors.blueGrey,
                              ),
                              title: const Text(
                                'Email',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                              ),
                              subtitle: const Text("theresa89@domain.ltd",
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width - 32,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey,
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            // add advertisements
                            ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            AddAdvertisement()));
                              },
                              leading: const Icon(
                                Icons.add,
                                color: Colors.blueGrey,
                              ),
                              title: const Text(
                                'Add Advertisement',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                            // my advertisements
                            ListTile(
                              onTap: () {
                                // Navigator.push(
                                // context, CupertinoPageRoute(builder: (context) => const MyAdvertisements());
                              },
                              leading: const Icon(
                                Icons.list,
                                color: Colors.blueGrey,
                              ),
                              title: const Text(
                                'My Advertisements',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 32,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey,
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 0),
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            // user phone nummber
                            ListTile(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, "/profile-settings");
                              },
                              leading: const Icon(
                                Icons.settings,
                                color: Colors.blueGrey,
                              ),
                              title: const Text(
                                'Settings',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                            // user email
                            const ListTile(
                              leading: Icon(
                                Icons.help,
                                color: Colors.blueGrey,
                              ),
                              title: Text(
                                'Help',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                            ListTile(
                              onTap: () {
                                FirebaseAuth.instance.signOut();
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                              },
                              leading: const Icon(
                                Icons.logout,
                                color: Colors.blueGrey,
                              ),
                              title: const Text(
                                'Logout',
                                style: TextStyle(
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // date of registration
                    const Text(
                      'Registered on 12.12.2021',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ]),
                ))));
  }
}
