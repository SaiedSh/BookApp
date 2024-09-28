import 'package:bookapp/model/global/global.dart';
import 'package:bookapp/view/home/home_screen.dart';
import 'package:flutter/material.dart';

// class NavigationbarScreen extends StatefulWidget {
//   const NavigationbarScreen({super.key});

//   @override
//   State<NavigationbarScreen> createState() => _NavigationbarScreenState();
// }

// class _NavigationbarScreenState extends State<NavigationbarScreen> {
//   int _selectedIndex = 0;
//   static const List<Widget> _widgetOptions = <Widget>[
//     HomeScreen(),
//     Text('2'),
//     Text('3'),
//     Text('4')
//   ];
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _widgetOptions.elementAt(_selectedIndex),
//       bottomNavigationBar: Directionality(
//         textDirection: TextDirection.rtl,
//         child: SizedBox(
//           height: 70,
//           child: BottomNavigationBar(
//             type: BottomNavigationBarType.fixed,
//             unselectedLabelStyle:
//                 TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
//             selectedLabelStyle: TextStyle(
//                 color: primaryColor, fontWeight: FontWeight.w500, fontSize: 10),
//             showSelectedLabels: true,
//             selectedItemColor: primaryColor,
//             showUnselectedLabels: true,
//             unselectedItemColor: primaryColor,
//             backgroundColor: Colors.white,
//             onTap: _onItemTapped,
//             currentIndex: _selectedIndex,
//             items: <BottomNavigationBarItem>[
//               BottomNavigationBarItem(
//                 icon: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Image(
//                       image: AssetImage('lib/assets/images/home.png'),
//                       fit: BoxFit.fill,
//                       width: 25,
//                       height: 30,
//                     ),
//                     Text('خانه'),
//                     if (_selectedIndex == 0)
//                       Container(height: 5, color: Colors.blue)
//                   ],
//                 ),
//                 label: '',
//               ),
//               BottomNavigationBarItem(
//                 icon: Image(
//                   image: AssetImage('lib/assets/images/plus.png'),
//                   width: 25,
//                   height: 25,
//                 ),
//                 label: 'نیکو پلاس',
//               ),
//               BottomNavigationBarItem(
//                   icon: Image(
//                     image: AssetImage('lib/assets/images/category.png'),
//                     width: 25,
//                     height: 25,
//                   ),
//                   label: 'دسته بندی'),
//               BottomNavigationBarItem(
//                   icon: Image(
//                     image: AssetImage('lib/assets/images/library.png'),
//                     width: 25,
//                     height: 25,
//                   ),
//                   label: 'کتابخانه من'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class NavigationbarScreen extends StatefulWidget {
  const NavigationbarScreen({super.key});

  @override
  State<NavigationbarScreen> createState() => _NavigationbarScreenState();
}

class _NavigationbarScreenState extends State<NavigationbarScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    Center(child: Text('Niko Plus', style: TextStyle(fontSize: 24))),
    Center(child: Text('Category', style: TextStyle(fontSize: 24))),
    Center(child: Text('My Library', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex, // صفحه فعال
        children: _pages, // صفحات
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  CustomBottomNavigationBar(
      {required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      color: Colors.white, // رنگ پس زمینه نوار
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem('lib/assets/images/home.png', "خانه", 0, 25, 25, 0),
            _buildNavItem(
                'lib/assets/images/plus.png', "نیکو پلاس", 1, 28, 25, 0),
            _buildNavItem('lib/assets/images/category2.png', "دسته بندی ها", 2,
                20, 22, 3),
            _buildNavItem(
                'lib/assets/images/library.png', "کتابخانه من", 3, 22, 25, 0),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(String imagePath, String label, int index, double? width,
      double? height, double categoryHeight) {
    bool isSelected = selectedIndex == index;
    return SizedBox(
      width: 70,
      height: 49,
      child: GestureDetector(
        onTap: () => onItemTapped(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
                image: AssetImage(imagePath),
                width: width,
                height: height,
                fit: BoxFit.fill,
                color: isSelected ? secondaryColor : Colors.black),
            SizedBox(
              height: categoryHeight,
            ),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 10,
                color: isSelected ? secondaryColor : Colors.black,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            if (isSelected)
              Container(height: 4, color: secondaryColor, width: 40),
          ],
        ),
      ),
    );
  }
}
