import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:migrant/profile_page/loged_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return LogedProfile(
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
    );
  }
}
