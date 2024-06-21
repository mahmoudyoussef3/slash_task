import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slash_task/presentation/views/screens/favorite.dart';
import 'package:slash_task/presentation/views/screens/home.dart';
import 'package:slash_task/presentation/views/screens/my_cart.dart';
import 'package:slash_task/presentation/views/screens/profile.dart';

class BottomNavController extends StatefulWidget {
  const BottomNavController({super.key});

  @override
  State<BottomNavController> createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  int _currentIndex = 0;
  List<Widget> screens = const [
    HomeScreen(),
    FavoriteScreen(),
    MYCartScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: const Color(0xffFDFDFD),
          ),
          child: BottomNavigationBar(
            elevation: 0,
            selectedLabelStyle: GoogleFonts.urbanist(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: const Color(
                  0xff292929),
            ),
            unselectedLabelStyle: GoogleFonts.urbanist(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: const Color(
                  0xff292929),
            ),
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor:
                const Color(0xff292929),
            unselectedItemColor:
                const Color(0xffBDBDBD),
            currentIndex: _currentIndex,
            items:  [
              BottomNavigationBarItem(icon: Image.asset('assets/bottom_nav_icons/home.png'), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/bottom_nav_icons/heart.jpg'), label: 'Favorites'),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/bottom_nav_icons/shopping-cart.png'), label: 'My Cart'),
              BottomNavigationBarItem(
                  icon:Image.asset('assets/bottom_nav_icons/profile-circle.png'), label: 'Profile'),
            ],
          ),
        ),
        body: screens[_currentIndex]);
  }
}
