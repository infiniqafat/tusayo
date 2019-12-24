import 'package:flutter/material.dart';
import 'package:tusayo/src/helper/color.dart';
import 'package:tusayo/src/screen/acount.dart';
import 'package:tusayo/src/screen/cart.dart';
import 'package:tusayo/src/screen/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tusayo/src/screen/transaction.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => new _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _bottomNavCurrentIndex = 0;
  List<Widget> _container = [
    new MyHomePage(),
    new CartPage(),
    new TransactionPage(),
    new MyHomePage(),
    new Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: _container[_bottomNavCurrentIndex],
        bottomNavigationBar: _buildBottomNavigation()
    );
  }

  Widget _buildBottomNavigation(){
    return new BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          print(_container);
          _bottomNavCurrentIndex = index;
        });
      },
      currentIndex: _bottomNavCurrentIndex,
      items: [
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.home,
            color: AppPalette.green,
          ),
          icon: new Icon(
            Icons.home,
            color: Colors.grey,
          ),
          title: new Text(
            'Beranda',
            style: TextStyle(color: _bottomNavCurrentIndex == 0?AppPalette.green:Colors.grey ),
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.shopping_basket,
            color: AppPalette.green,
          ),
          icon: new Icon(
            Icons.shopping_basket,
            color: Colors.grey,
          ),
          title: new Text('Keranjang',
            style: TextStyle(color: _bottomNavCurrentIndex == 1?AppPalette.green:Colors.grey ),
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.assignment,
            color: AppPalette.green,
          ),
          icon: new Icon(
            Icons.assignment,
            color: Colors.grey,
          ),
          title: new Text('Pesanan',
            style: TextStyle(color: _bottomNavCurrentIndex == 2?AppPalette.green:Colors.grey ),
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: new Icon(
            FontAwesomeIcons.whatsapp,
            color: AppPalette.green,
          ),
          icon: new Icon(
            FontAwesomeIcons.whatsapp,
            color: Colors.grey,
          ),
          title: new Text('Whatsapp',
            style: TextStyle(color: _bottomNavCurrentIndex == 3?AppPalette.green:Colors.grey ),
          ),
        ),
        BottomNavigationBarItem(
          activeIcon: new Icon(
            Icons.person,
            color: AppPalette.green,
          ),
          icon: new Icon(
            Icons.person,
            color: Colors.grey,
          ),
          title: new Text('Akun',
            style: TextStyle(color: _bottomNavCurrentIndex == 4?AppPalette.green:Colors.grey ),
          ),
        ),
      ],
    );
  }
}
