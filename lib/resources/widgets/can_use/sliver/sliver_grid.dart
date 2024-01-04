import 'package:flutter/material.dart';

import 'package:start_up_workspace_web/main.dart';

class CustomSliverGrid extends StatelessWidget {
  const CustomSliverGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Container(
          decoration:
              BoxDecoration(color: customTheme.grey, borderRadius: BorderRadius.circular(8)),
        );
      },
    );
  }
}
