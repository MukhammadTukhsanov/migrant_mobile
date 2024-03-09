import 'package:flutter/material.dart';
import 'package:migrant/profile_page/profile_settings.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    List<ProfileSettingsListItem> settings = [
      // ProfileSettingsListItem(
      //   listTitle: 'Change email address',
      //   onTap: null,
      // ),
      ProfileSettingsListItem(
        listTitle: 'Change password',
        onTap: () {
          Navigator.pushNamed(context, '/change-password');
        },
      ),
      ProfileSettingsListItem(
          listTitle: 'Terms and conditions',
          onTap: () {
            Navigator.pushNamed(context, '/terms-and-conditions');
          }),
      ProfileSettingsListItem(
        listTitle: 'License',
        onTap: null,
      ),
      ProfileSettingsListItem(
        listTitle: 'Help',
        onTap: null,
      ),
      ProfileSettingsListItem(
        listTitle: 'Logout',
        onTap: () {
          Navigator.pushNamed(context, '/login');
        },
      ),
      ProfileSettingsListItem(
        listTitle: 'Delete account',
        onTap: null,
      ),
    ];
    // user profile settings page
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Profile Settings',
          style: TextStyle(color: Colors.black),
        ),
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListView.builder(
              itemCount: settings.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  shape: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  title: Text(
                    settings[index].listTitle,
                    style: const TextStyle(
                        fontSize: 16, textBaseline: TextBaseline.alphabetic),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                      size: 18, color: Colors.blueGrey.shade300),
                  onTap: settings[index].onTap,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
