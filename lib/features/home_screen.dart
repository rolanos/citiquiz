import 'package:citiquiz/features/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'news/news_screen.dart';
import 'places/places_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

getAppbarTitle(int index) {
  switch (index) {
    case 0:
      return "Новости";
    case 1:
      return "Места";
    default:
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int navIndex = 0;
  bool isGameSelected = false;

  List<Widget> pages = [
    NewsScreen(),
    PlacesScreen(),
    const Placeholder(),
    const Placeholder(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0),
          child: Text(
            getAppbarTitle(navIndex),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: ColorsUI.black,
                  fontSize: 32,
                ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isGameSelected = true;
          });
        },
        backgroundColor: ColorsUI.lime,
        shape: const CircleBorder(),
        child: Padding(
          padding: EdgeInsets.all(6.0),
          child: SvgPicture.asset(
            "asset/icons/game_outline.svg",
            colorFilter: (isGameSelected)
                ? ColorFilter.mode(
                    ColorsUI.lime,
                    BlendMode.srcIn,
                  )
                : ColorFilter.mode(
                    ColorsUI.white,
                    BlendMode.srcIn,
                  ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: navIndex,
        backgroundColor: Colors.black,
        onTap: (value) {
          setState(() {
            navIndex = value;
            isGameSelected = false;
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
            icon: Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.location_on,
              ),
            ),
            label: 'Места   ',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.headphones,
              ),
            ),
            label: '  Поддержка',
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
