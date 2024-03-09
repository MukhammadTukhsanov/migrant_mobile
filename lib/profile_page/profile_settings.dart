import 'package:flutter/material.dart';

class ProfileSettingsListItem {
  String listTitle;
  VoidCallback? onTap;

  ProfileSettingsListItem({
    required this.listTitle,
    this.onTap,
  });
}
