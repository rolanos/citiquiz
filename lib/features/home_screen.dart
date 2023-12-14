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
        type: BottomNavigationBarType.fixed,
        currentIndex: navIndex,
        backgroundColor: Colors.black,
        onTap: (value) {
          setState(() {
            navIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.newspaper,
            ),
            label: 'Новости',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.location_on,
            ),
            label: 'Места',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.headphones,
            ),
            label: 'Поддержка',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Профиль',
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
