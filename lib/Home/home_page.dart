import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:fleet_management/Pages/home.dart';
import 'package:fleet_management/Pages/profile_page.dart';
import 'package:fleet_management/Pages/receipt_page.dart';
import 'package:fleet_management/Pages/schedule_page.dart';
import 'package:fleet_management/Pages/delivery_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: const [
            Home(),
            DeliveryPage(),
            SchedulePage(),
            ReceiptPage(),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(icon: Icon(Icons.home), title: Text('HomePage')),
            BottomNavyBarItem(icon: Icon(Icons.fire_truck), title: Text('Delivery')),
            BottomNavyBarItem(icon: Icon(Icons.date_range), title: Text('Schedule')),
            BottomNavyBarItem(icon: Icon(Icons.library_add), title: Text('Receipt')),
            BottomNavyBarItem(icon: Icon(Icons.account_circle_rounded), title: Text('Profile')),
          ],
          onItemSelected: (index) {
            setState(() {
              _pageController.jumpToPage(index);
            });
          }),
    );
  }
}
