import 'package:citiquiz/features/core/colors.dart';
import 'package:citiquiz/features/core/widget/custom_card.dart';
import 'package:citiquiz/features/core/widget/title_card.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

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
                    name: 'Место 1',
                    description: 'Описание места',
                    date: '10.10.2010',
                  ),
                  CustomCard(
                    name: 'Место 2',
                    description: 'Описание места',
                    date: '10.10.2010',
                  ),
                  CustomCard(
                    name: 'Место 3',
                    description: 'Описание места',
                    date: '10.10.2010',
                  ),
                  CustomCard(
                    name: 'Место 4',
                    description: 'Описание места',
                    date: '10.10.2010',
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
