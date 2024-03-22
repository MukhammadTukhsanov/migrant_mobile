import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:migrant/components/alert.dart';
import 'package:migrant/components/gap.dart';
import 'package:migrant/pages/profile_page/advertisement/add_advertisement.dart';
import 'package:migrant/pages/profile_page/advertisement/my_advertisement.dart';
import 'package:migrant/pages/choose_country/verify_profile/index.dart';

//ignore: must_be_immutable
class LogedProfile extends StatefulWidget {
  String userName;
  String userSurname;
  String userLocation;
  bool isVerified;
  bool isPassanger;
  double userRating;
  String userPhone;
  String userImage;
  String userEmail;
  double userAdvertisements;
  String userRegistrationDate;

  LogedProfile(
      {super.key,
      required this.userName,
      required this.userSurname,
      required this.userLocation,
      required this.isVerified,
      required this.isPassanger,
      required this.userRating,
      required this.userPhone,
      required this.userImage,
      required this.userEmail,
      required this.userAdvertisements,
      required this.userRegistrationDate});

  @override
  State<LogedProfile> createState() => _LogedProfileState();
}

class _LogedProfileState extends State<LogedProfile> {
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
                                        Positioned(
                                          top: 0,
                                          left: 0,
                                          right: 0,
                                          child: Center(
                                            child: CircleAvatar(
                                              radius: 50,
                                              backgroundImage: NetworkImage(
                                                  widget.userImage),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          left: 0,
                                          right: 0,
                                          child: Center(
                                            child: Column(children: [
                                              Gap(size: 110),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${widget.userName} ${widget.userSurname}',
                                                    style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  // verified user
                                                  Gap(size: 6),
                                                  // verified user
                                                  if (widget.isVerified)
                                                    const Icon(
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
                                                  const Icon(
                                                    Icons.location_on,
                                                    color: Colors.grey,
                                                    size: 18,
                                                  ),
                                                  Gap(size: 6),
                                                  Text(
                                                    widget.userLocation,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                  // verified user
                                                ],
                                              ),
                                              Gap(size: 3),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  // user type passenger with icon
                                                  if (widget.isPassanger)
                                                    const Icon(
                                                      Icons.hail_sharp,
                                                      color: Colors.blueGrey,
                                                      size: 18,
                                                    ),
                                                  if (!widget.isPassanger)
                                                    const Icon(
                                                      Icons.directions_car,
                                                      color: Colors.blueGrey,
                                                      size: 18,
                                                    ),
                                                  Gap(size: 6),
                                                  if (widget.isPassanger)
                                                    const Text("Passanger",
                                                        style: TextStyle(
                                                          color:
                                                              Colors.blueGrey,
                                                        )),
                                                  if (!widget.isPassanger)
                                                    const Text("Driver",
                                                        style: TextStyle(
                                                          color:
                                                              Colors.blueGrey,
                                                        )),
                                                  Gap(size: 6),

                                                  Gap(size: 6),
                                                  // user rayting
                                                  const Icon(
                                                    Icons.star,
                                                    color: Colors.blueGrey,
                                                    size: 18,
                                                  ),
                                                  Gap(size: 6),
                                                  Text(
                                                      widget.userRating
                                                          .toString(),
                                                      style: const TextStyle(
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
                    Gap(size: 20),
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
                                if (widget.isVerified) {
                                  // ignore: deprecated_member_use
                                  // launch("tel://${widget.userPhone}");
                                }
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
                              subtitle: Text(
                                widget.userPhone,
                                style: const TextStyle(
                                  color: Colors.blueGrey,
                                ),
                              ),
                              // not verified box with text
                              trailing: widget.isVerified
                                  ? const SizedBox()
                                  : GestureDetector(
                                      onTap: () {
                                        // Navigator push to verifyProfile page
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    const VerifiyProfile()));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 5,
                                            bottom: 5),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              color: Colors.blueGrey, width: 1),
                                        ),
                                        child: const Text(
                                          "Verify",
                                          style: TextStyle(
                                            color: Colors.blueGrey,
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                            // user email
                            ListTile(
                              onTap: () {
                                // ignore: deprecated_member_use
                                // launch("mailto: ${widget.userEmail}");
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
                              subtitle: Text(widget.userEmail,
                                  style: const TextStyle(
                                    color: Colors.blueGrey,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(size: 20),

                    if (!widget.isPassanger)
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
                                  if (widget.isVerified) {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                const AddAdvertisement()));
                                  }
                                },
                                leading: Icon(
                                  Icons.add,
                                  color: widget.isVerified
                                      ? Colors.blueGrey
                                      : Colors.blueGrey.shade200,
                                ),
                                title: Text(
                                  'Add Advertisement',
                                  style: TextStyle(
                                    color: widget.isVerified
                                        ? Colors.blueGrey
                                        : Colors.blueGrey.shade200,
                                  ),
                                ),
                                trailing: widget.isVerified
                                    ? const SizedBox()
                                    : GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 5,
                                              bottom: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: const Text(
                                            "Not verified",
                                            style: TextStyle(
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                              // my advertisements
                              ListTile(
                                onTap: () {
                                  if (widget.isVerified) {
                                    Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                            builder: (context) =>
                                                const MyAdvertisements()));
                                  }
                                },
                                leading: Icon(
                                  Icons.list,
                                  // color: Colors.blueGrey,
                                  color: widget.isVerified
                                      ? Colors.blueGrey
                                      : Colors.blueGrey.shade200,
                                ),
                                title: Text(
                                  'My Advertisements',
                                  style: TextStyle(
                                    color: widget.isVerified
                                        ? Colors.blueGrey
                                        : Colors.blueGrey.shade200,
                                  ),
                                ),
                                trailing: widget.isVerified
                                    ? const SizedBox()
                                    : GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              top: 5,
                                              bottom: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: const Text(
                                            "Not verified",
                                            style: TextStyle(
                                              color: Colors.redAccent,
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    if (!widget.isPassanger) Gap(size: 20),
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
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => Alert(
                                        icon: Icons.logout,
                                        title:
                                            'Are you sure you want to logout?',
                                        accept: 'Logout',
                                        acceptFunction: () {
                                          Navigator.pushNamed(
                                              context, '/login');
                                        }));
                                FirebaseAuth.instance.signOut();
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
                    Gap(size: 20),
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
