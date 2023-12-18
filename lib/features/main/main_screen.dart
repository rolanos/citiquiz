import 'dart:ui';

import 'package:citiquiz/features/core/colors.dart';
import 'package:citiquiz/features/main/widgets/partner_widget.dart';
import 'package:citiquiz/features/main/widgets/story_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/news_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 84),
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage(
              "asset/images/almaty.jpg",
            ),
          ),
        ),
        child: FutureBuilder(
            future: SharedPreferences.getInstance(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              String? nick = snapshot.data!.getString('nick');
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "asset/images/citiquiz.png",
                        width: size.width * 0.3,
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(
                          "Профиль",
                          style: textTheme.bodyLarge!.copyWith(fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    "Привет ${nick ?? "-"}",
                    style: textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      color: ColorsUI.lime,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text(
                      "Отсканировать QR-код",
                      style:
                          textTheme.bodyLarge!.copyWith(color: ColorsUI.black),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.12,
                  ),
                  SizedBox(
                    height: size.height * 0.2,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        StoryWidget(text: "Сторис 1"),
                        SizedBox(
                          width: 8.0,
                        ),
                        StoryWidget(text: "Сторис 2"),
                        SizedBox(
                          width: 8.0,
                        ),
                        StoryWidget(text: "Сторис 3"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    "Новости",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: ColorsUI.black,
                          fontSize: 20,
                        ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        NewsWidget(text: "Новость 1"),
                        SizedBox(
                          width: 8.0,
                        ),
                        NewsWidget(text: "Новость 2"),
                        SizedBox(
                          width: 8.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    "Партнеры",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: ColorsUI.black,
                          fontSize: 20,
                        ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    height: size.width * 0.2,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        PartnerWidget(text: "Новость 1"),
                        SizedBox(
                          width: 8.0,
                        ),
                        PartnerWidget(text: "Новость 2"),
                        SizedBox(
                          width: 8.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    "Достопримечательности",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: ColorsUI.black,
                          fontSize: 20,
                        ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    height: size.width * 0.2,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        NewsWidget(text: "Место 1"),
                        SizedBox(
                          width: 8.0,
                        ),
                        NewsWidget(text: "Место 2"),
                        SizedBox(
                          width: 8.0,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
