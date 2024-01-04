import 'package:flutter/material.dart';
import 'package:start_up_workspace_web/resources/widgets/can_use/sliver/sliver_grid.dart';
import 'package:start_up_workspace_web/resources/widgets/can_use/sliver/sliver_list.dart';

class SliverBodyView extends StatelessWidget {
  const SliverBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: 16),
        ),
        CustomSliverGrid(),
        CustomSliverList()
      ],
    );
  }
}
