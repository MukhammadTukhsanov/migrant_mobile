import 'package:flutter/material.dart';
import 'package:migrant/controllers/index.dart';
// import 'package:migrant/pages/search_main.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BottomNavigationList.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: BottomNavigationBarItems,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.blueGrey.shade600,
        unselectedItemColor: Colors.blueGrey.shade300,
        backgroundColor: Colors.white,
      ),
    );
  }
}
