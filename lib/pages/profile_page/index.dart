import 'package:flutter/material.dart';
import 'package:migrant/components/buttons.dart';
import 'package:migrant/components/gap.dart';
import 'package:migrant/pages/profile_page/loged_profile.dart';

class ProfilePage extends StatefulWidget {
  final bool isLoged = true;
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return widget.isLoged
        ? LogedProfile(
            userName: "Theresea",
            userSurname: "Schröder",
            isVerified: false,
            isPassanger: false,
            userImage: "https://mighty.tools/mockmind-api/content/human/6.jpg",
            userPhone: "+49 123 456 789",
            userEmail: "theresa89@domain.ltd",
            userLocation: "Berlin, Germany",
            userRating: 4.5,
            userAdvertisements: 12,
            userRegistrationDate: "12.12.2020",
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text("Profile"),
            ),
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                height: 500,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.person,
                        size: 150,
                        color: Colors.blueGrey,
                      ),
                      const Text(
                        "Please log in to see your profile",
                        style: TextStyle(
                            color: Colors.blueGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      Gap(size: 20),
                      FillButton(onPress: () {}, text: "Log in"),
                      Gap(size: 8),
                      FillButton(onPress: () {}, text: "Register"),
                    ],
                  ),
                ),
              ),
            ));
  }
}
