import 'package:flutter/material.dart';
import 'package:migrant/prifile_settings/profile_settings.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  List<ProfileSettingsListItem> settings = [
    ProfileSettingsListItem(
      listTitle: 'Change email address',
      onTap: null,
    ),
    ProfileSettingsListItem(
      listTitle: 'Change password',
      onTap: null,
    ),
    ProfileSettingsListItem(
      listTitle: 'Terms and conditions',
      onTap: null,
    ),
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
      onTap: null,
    ),
    ProfileSettingsListItem(
      listTitle: 'Delete account',
      onTap: null,
    ),
  ];
  @override
  Widget build(BuildContext context) {
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
