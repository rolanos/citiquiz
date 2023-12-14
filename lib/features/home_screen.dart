import 'package:citiquiz/features/core/colors.dart';
import 'package:flutter/material.dart';

import 'news/news_screen.dart';
import 'places/places_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int navIndex = 0;
  List<Widget> pages = [
    NewsScreen(),
    PlacesScreen(),
    const Placeholder(),
    const Placeholder(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorsUI.lime,
        shape: const CircleBorder(),
        child: const Text(
          '+',
          style: TextStyle(fontSize: 38),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        currentIndex: navIndex,
        onTap: (value) {
          setState(() {
            navIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.newspaper, 'Новости', 0, navIndex),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.location_on, 'Места', 1, navIndex),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.headphones, 'Профиль', 2, navIndex),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.person, 'Профиль', 3, navIndex),
            label: '',
          ),
        ],
      ),
      body: IndexedStack(
        index: navIndex,
        children: pages,
      ),
    );
  }
}

Widget _buildIcon(IconData iconData, String text, int index, int navIndex) =>
    Container(
      width: double.infinity,
      height: kBottomNavigationBarHeight,
      child: Material(
        color: index == navIndex ? ColorsUI.lime : ColorsUI.black,
        child: InkWell(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                iconData,
                color: Colors.white,
              ),
              Text(
                text,
              ),
            ],
          ),
        ),
      ),
    );
