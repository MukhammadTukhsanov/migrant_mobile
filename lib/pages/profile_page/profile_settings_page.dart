import 'package:flutter/material.dart';
import 'package:migrant/components/alert.dart';
import 'package:migrant/components/buttons.dart' as buttons;
import 'package:migrant/components/gap.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({super.key});

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    // List<ProfileSettingsListItem> settings = [
    //   ProfileSettingsListItem(
    //     listTitle: 'Change password',
    //     onTap: () {
    //       Navigator.pushNamed(context, '/change-password');
    //     },
    //   ),
    //   ProfileSettingsListItem(
    //       listTitle: 'Terms and conditions',
    //       onTap: () {
    //         Navigator.pushNamed(context, '/terms-and-conditions');
    //       }),
    //   ProfileSettingsListItem(
    //     listTitle: 'License',
    //     onTap: null,
    //   ),
    //   ProfileSettingsListItem(
    //     listTitle: 'Help',
    //     onTap: null,
    //   ),
    //   ProfileSettingsListItem(
    //     listTitle: 'Logout',
    //     onTap: () {
    //       Navigator.pushNamed(context, '/login');
    //     },
    //   ),
    //   ProfileSettingsListItem(
    //     listTitle: 'Delete account',
    //     onTap: null,
    //   ),
    // ];
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
      body: Column(
        children: [
          const ProfileSettingsListItem(
            text: 'Change password',
            icon: Icons.lock,
          ),
          const ProfileSettingsListItem(
            text: 'Terms and conditions',
            icon: Icons.description,
          ),
          const ProfileSettingsListItem(
            text: 'License',
            icon: Icons.assignment,
          ),
          const ProfileSettingsListItem(
            text: 'Help',
            icon: Icons.help,
          ),
          ProfileSettingsListItem(
            text: 'Logout',
            icon: Icons.logout,
            onTap: () {
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => Alert(
                      icon: Icons.logout,
                      title: 'Are you sure you want to logout?',
                      accept: 'Logout',
                      acceptFunction: () {
                        Navigator.pushNamed(context, '/login');
                      }));
              // Navigator.pushNamed(context, '/login');
            },
          ),
          ProfileSettingsListItem(
            text: 'Delete account',
            icon: Icons.delete,
            onTap: () {
              showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => Alert(
                      icon: Icons.delete,
                      title: 'Are you sure you want to delete your account?',
                      accept: 'Delete',
                      acceptFunction: () {}));
            },
          ),
        ],
      ),
    );
  }
}

class ProfileSettingsListItem extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final IconData icon;

  const ProfileSettingsListItem(
      {super.key, required this.text, this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            color: Colors.blueGrey,
          ),
          title: Text(text),
          onTap: onTap,
          trailing: const Icon(Icons.arrow_forward_ios,
              color: Colors.blueGrey, size: 16),
        ),
        const Divider(
          height: 1,
          color: Colors.blueGrey,
        ),
      ],
    );
  }
}
