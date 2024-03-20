import 'package:flutter/material.dart';
import 'package:migrant/pages/chat/index.dart';
import 'package:migrant/pages/home_page_/index.dart';
import 'package:migrant/pages/profile_page/index.dart';

// ignore: non_constant_identifier_names
final BottomNavigationList = [
  const HomePage(),
  const ChatsPage(),
  const ProfilePage(),
];

// ignore: non_constant_identifier_names
// final BottomNavigationRoutes = [
//   '/search-main',
//   '/search-main',
//   '/search-main',
// ];

// ignore: constant_identifier_names
const BottomNavigationBarItems = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.chat_outlined),
    label: 'Chat',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person),
    label: 'Profile',
  ),
];
