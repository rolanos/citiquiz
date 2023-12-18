import 'package:auto_size_text/auto_size_text.dart';
import 'package:citiquiz/features/core/colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String name;
  final String description;
  final String date;

  final Widget? image;
  const CustomCard(
      {super.key,
      required this.name,
      required this.description,
      this.image,
      required this.date});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 24.0),
      width: size.width,
      constraints: BoxConstraints(
          minHeight: size.height * 0.12, maxHeight: size.height * 0.2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: ColorsUI.grey.withOpacity(0.15),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, top: 12.0),
                    child: Text(
                      name,
                      style: textTheme.titleMedium!
                          .copyWith(color: ColorsUI.black, fontSize: 14),
                    ),
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, bottom: 12.0),
                    child: AutoSizeText(
                      description,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleMedium!
                          .copyWith(color: ColorsUI.black, fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.0, top: 6.0),
                    child: Text(
                      date,
                      style: textTheme.bodyMedium!
                          .copyWith(color: ColorsUI.black, fontSize: 11),
                    ),
                  ),
                ),
                const Spacer(),
                if (image != null)
                  Align(
                    alignment: Alignment.bottomRight,
                    child: SizedBox(
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                          child: image),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
