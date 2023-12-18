import 'package:citiquiz/features/core/colors.dart';
import 'package:citiquiz/features/core/widget/custom_card.dart';
import 'package:citiquiz/features/core/widget/title_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
                    name: 'Приложение CITIQUIZ было запущено впервые!',
                    description:
                        'Дорогие друзья и партнеры, мобильное приложение нашего стартапа CITIQUIZ было успешно запущено в первый раз и в скором времени будет обновляться.',
                    date: '10.12.2023',
                    image: Image.asset(
                      "asset/images/news1.jpg",
                    ),
                  ),
                  CustomCard(
                    name: 'В приложении CITIQUIZ добавлены новые разделы',
                    description:
                        'В нашем мобильном приложении доработана Главная страница, страница вашего Профиля, а также сканера QR-кода.',
                    date: '14.12.2023',
                    image: Image.asset(
                      "asset/images/news2.jpg",
                    ),
                  ),
                  CustomCard(
                    name: 'Приложение CITIQUIZ расширяется',
                    description:
                        'Рады вам сообщить, что в ближайшее время в приложении будет реализована функциональность проходить увлекательные квизы! Сейчас же наша команда активно рабоатает над составлением и корректировкой вопросов для квизов.',
                    date: '15.12.2023',
                    image: Image.asset(
                      "asset/images/news3.jpg",
                    ),
                  ),
                  CustomCard(
                    name: 'Предлагайте свои вопросы для квизов',
                    description:
                        'Описание: Уважаемые пользователи, вы можете предложить свои вопросы и правильные ответы к ним отправив их к нам на корпоративную почту quiz_mobile@citiquiz.com',
                    date: '15.12.2023',
                    image: Image.asset(
                      "asset/images/news4.jpg",
                    ),
                  ),
                  CustomCard(
                    name: 'Нам нужны инвесторы',
                    description:
                        'Описание: Нашему стартапу требуются инвесторы. Чтобы узнать подробности свяжитесь с нами через нашу корпоративную почту invest@citiquiz.com',
                    date: '17.12.2023',
                    image: Image.asset(
                      "asset/images/news5.jpg",
                    ),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Lottie.asset(
                    "asset/animations/news_all.json",
                    repeat: true,
                    width: MediaQuery.of(context).size.width * 0.35,
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
