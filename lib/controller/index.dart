import 'package:flutter/material.dart';
import 'package:migrant/chat/index.dart';
import 'package:migrant/pages/profile.dart';
import 'package:migrant/pages/search_main.dart';

// ignore: non_constant_identifier_names
final BottomNavigationList = [
  const SearchMain(),
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
