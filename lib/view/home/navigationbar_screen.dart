import 'package:bookapp/model/global/global.dart';
import 'package:bookapp/view/home/home_screen.dart';
import 'package:flutter/material.dart';

class NavigationbarScreen extends StatefulWidget {
  const NavigationbarScreen({super.key});

  @override
  State<NavigationbarScreen> createState() => _NavigationbarScreenState();
}

class _NavigationbarScreenState extends State<NavigationbarScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text('2'),
    Text('3'),
    Text('4')
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Directionality(
        textDirection: TextDirection.rtl,
        child: BottomNavigationBar(
          unselectedLabelStyle:
              TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
          selectedLabelStyle: TextStyle(
              color: primaryColor, fontWeight: FontWeight.w500, fontSize: 10),
          showSelectedLabels: true,
          selectedItemColor: primaryColor,
          showUnselectedLabels: true,
          unselectedItemColor: primaryColor,
          backgroundColor: Colors.white,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('lib/assets/images/home.png'),
                width: 25,
                height: 25,
              ),
              label: 'خانه',
            ),
            BottomNavigationBarItem(
              icon: Image(
                image: AssetImage('lib/assets/images/plus.png'),
                width: 25,
                height: 25,
              ),
              label: 'نیکو پلاس',
            ),
            BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage('lib/assets/images/category.png'),
                  width: 25,
                  height: 25,
                ),
                label: 'دسته بندی'),
            BottomNavigationBarItem(
                icon: Image(
                  image: AssetImage('lib/assets/images/library.png'),
                  width: 25,
                  height: 25,
                ),
                label: 'کتابخانه من'),
          ],
        ),
      ),
    );
  }
}
