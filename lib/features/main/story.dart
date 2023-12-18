import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';
import 'package:story_view/utils.dart';

class StoryWidget extends StatelessWidget {
  final List<StoryItem> storyItems;
  final StoryController controller;
  const StoryWidget(
      {super.key, required this.storyItems, required this.controller});

  @override
  Widget build(BuildContext context) {
    return StoryView(
        storyItems: storyItems,
        controller: controller, // pass controller here too
        repeat: true, // should the stories be slid forever
        onComplete: () {},
        onVerticalSwipeComplete: (direction) {
          if (direction == Direction.down) {
            Navigator.pop(context);
          }
        });
  }
}
