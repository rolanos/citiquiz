import 'dart:ui';

import 'package:citiquiz/features/core/colors.dart';
import 'package:citiquiz/features/main/story.dart';
import 'package:citiquiz/features/main/widgets/partner_widget.dart';
import 'package:citiquiz/features/main/widgets/story_widget.dart';
import 'package:citiquiz/features/qr/bloc/qr_bloc.dart';
import 'package:citiquiz/features/qr/qr_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'widgets/news_widget.dart';
import "package:story_view/story_view.dart";

class MainScreen extends StatelessWidget {
  final Function() newsCallback;
  final Function() placesCallback;
  final StoryController controller = StoryController();
  MainScreen(
      {super.key, required this.newsCallback, required this.placesCallback});

  @override
  Widget build(BuildContext context) {
    List<StoryItem> storyItems = [
      StoryItem.pageImage(
        url:
            "https://mykaleidoscope.ru/x/uploads/posts/2022-09/1663200247_14-mykaleidoscope-ru-p-gorod-almati-kazakhstan-oboi-15.jpg",
        controller: controller,
      ),
      StoryItem.pageImage(
        url:
            "https://static.tildacdn.com/tild3561-3066-4965-b234-636538356561/_3.jpg",
        controller: controller,
      ),
      StoryItem.pageImage(
        url:
            "https://mykaleidoscope.ru/x/uploads/posts/2022-09/1663219067_19-mykaleidoscope-ru-p-kazakhstan-stolitsa-almati-pinterest-19.jpg",
        controller: controller,
      ),
      StoryItem.pageImage(
        url:
            "https://sportishka.com/uploads/posts/2022-04/1650612019_66-sportishka-com-p-gorod-almati-kazakhstan-krasivo-foto-72.jpg",
        controller: controller,
      ),
    ];

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
                  BlocBuilder<QrBloc, QrState>(
                    builder: (context, state) {
                      if (state is QrInitial) {
                        if (state.qr == null || state.qr == "") {
                          return GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) => QrViewScreeen(),
                                transitionDuration: Duration(milliseconds: 370),
                                transitionsBuilder: (_, a, __, c) =>
                                    FadeTransition(opacity: a, child: c),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                color: ColorsUI.lime,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Text(
                                "Отсканировать QR-код",
                                style: textTheme.bodyLarge!
                                    .copyWith(color: ColorsUI.black),
                              ),
                            ),
                          );
                        }
                        return GestureDetector(
                          onTap: () => (
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder: (_, __, ___) => QrViewScreeen(),
                                transitionDuration: Duration(milliseconds: 370),
                                transitionsBuilder: (_, a, __, c) =>
                                    FadeTransition(opacity: a, child: c),
                              ),
                            ),
                          ),
                          child: QrImageView(
                            size: size.width * 0.2,
                            data: state.qr!,
                            backgroundColor: Colors.white,
                          ),
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                  SizedBox(
                    height: size.height * 0.15,
                  ),
                  SizedBox(
                    height: size.height * 0.15,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => StoryWidget(
                            storyItems: storyItems,
                            controller: controller,
                          ),
                          transitionDuration: const Duration(milliseconds: 370),
                          transitionsBuilder: (_, a, __, c) =>
                              FadeTransition(opacity: a, child: c),
                        ),
                      ),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          StoryWidgetContainer(
                            text: "Сторис 1",
                            assetPath: 'asset/images/almaty.jpg',
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          StoryWidgetContainer(
                            text: "Сторис 2",
                            assetPath: 'asset/images/almaty.jpg',
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                        ],
                      ),
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
                    height: 20.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            newsCallback();
                          },
                          child: Text(
                            "См. все >",
                            style: textTheme.bodyMedium!
                                .copyWith(color: Colors.black),
                          ),
                        )
                      ],
                    ),
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
                    height: 20.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            placesCallback();
                          },
                          child: Text(
                            "См. все >",
                            style: textTheme.bodyMedium!
                                .copyWith(color: Colors.black),
                          ),
                        )
                      ],
                    ),
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
