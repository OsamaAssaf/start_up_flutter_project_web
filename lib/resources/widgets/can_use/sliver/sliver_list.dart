import 'package:flutter/material.dart';
import 'package:start_up_workspace/main.dart';

class CustomSliverList extends StatelessWidget {
  const CustomSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 7,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            height: 65,
            decoration: BoxDecoration(
                color: customTheme.grey,
                borderRadius: BorderRadius.circular(8)),
          ),
        );
      },
    );
  }
}
