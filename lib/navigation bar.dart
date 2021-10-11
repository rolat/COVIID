
import 'package:COVID19/bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:COVID19/pages/home_page.dart';
import 'package:COVID19/pages/statistics_page.dart';
import 'package:COVID19/screens/home_screen.dart';
import 'package:COVID19/views/CountriesView.dart';
import 'package:COVID19/FaQ/faq_data.dart';
import 'package:COVID19/screens/HomeScreen.dart';

class BottomNavScreen extends StatefulWidget {

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {

  final List<Widget> screens = [
    HomePage(),
    StatisticPage(),
    CountriesView(),
    HomeScreen(),
    QAF(),
    DonatePlasma(),

  ];

  final PageStorageBucket bucket = PageStorageBucket();
  int _selectedIndex = 2;

  static const TextStyle optionsStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: screens[_selectedIndex],
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.home),label:'Home', // Potentially news?
          ),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.infoCircle), label:'Statistics',
          ),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.mapMarked), label:'Countries',
          ),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.qrcode), label: 'Qr_code',
          ),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.question), label: ' QAF',
          ),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.dotCircle), label: ' more options',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemSelected,
      ),
    );
  }
}
