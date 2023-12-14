import 'package:citiquiz/features/core/colors.dart';
import 'package:citiquiz/features/core/widget/custom_card.dart';
import 'package:citiquiz/features/core/widget/title_card.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 24.0),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Новости",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: ColorsUI.black,
                      fontSize: 32,
                    ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              TitleCard(),
              const SizedBox(height: 32.0),
              ListView(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                children: [
                  CustomCard(
                    name: 'Новые вопросы уже доступны',
                    description: 'Описание новости',
                    date: '10.10.2010',
                    image: Image.asset(
                      "asset/images/almaty.jpg",
                    ),
                  ),
                  CustomCard(
                    name: 'Новость 2',
                    description: 'Описание новости',
                    date: '10.10.2010',
                    image: Image.asset(
                      "asset/images/almaty.jpg",
                    ),
                  ),
                  CustomCard(
                    name: 'Место 3',
                    description: 'Описание новости',
                    date: '10.10.2010',
                    image: Image.asset(
                      "asset/images/almaty.jpg",
                    ),
                  ),
                  CustomCard(
                    name: 'Место 4',
                    description: 'Описание новости',
                    date: '10.10.2010',
                    image: Image.asset(
                      "asset/images/almaty.jpg",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
