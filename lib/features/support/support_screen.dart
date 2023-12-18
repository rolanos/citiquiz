import 'package:citiquiz/features/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 42.0),
        padding: EdgeInsets.symmetric(horizontal: 48.0, vertical: 32.0),
        child: Container(
          height: 0.35 * size.height,
          padding: EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: ColorsUI.black,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    "asset/images/citiquiz.png",
                    width: size.width * 0.23,
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(135, 136, 140, 1),
                        borderRadius: BorderRadius.all(Radius.circular(6.0))),
                    child: Center(
                      child: Text(
                        "Связаться",
                        style: textTheme.bodyMedium!.copyWith(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(
                flex: 4,
              ),
              Text(
                "CITIQUIZ - новый и быстроразвивающийся стартап, который нацелен на привлечение старых-новых жителей нашего города отгадывать увлекательные квизы и викторины и тратить бонусы у наших партнеров",
                style: textTheme.bodyLarge!.copyWith(fontSize: 10, height: 1),
              ),
              Spacer(
                flex: 2,
              ),
              Text(
                "Телефон +7 (700) 111-11-11",
                style: textTheme.bodyMedium!.copyWith(fontSize: 12),
              ),
              Spacer(),
              Text(
                "Сайт www.citiquiz.com",
                style: textTheme.bodyMedium!.copyWith(fontSize: 12),
              ),
              Spacer(),
              Text(
                "VK: citiquiz",
                style: textTheme.bodyMedium!.copyWith(fontSize: 12),
              ),
              Spacer(),
              Text(
                "Insta: citiquiz",
                style: textTheme.bodyMedium!.copyWith(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
