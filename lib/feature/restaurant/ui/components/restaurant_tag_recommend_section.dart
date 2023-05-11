import 'package:flutter/material.dart';

import '../../../../shared/tag/app_tag_widget.dart';

class RestaurantTagRecommendSection extends StatelessWidget {
  List<AppTagItem> tags;
  Function(AppTagItem item)? onTap;

  RestaurantTagRecommendSection({
    required this.tags,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: tags.length,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      primary: false,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        final item = tags[index];
        return InkWell(
          onTap: () {
            onTap!(item);
          },
          child: AppTagWidget(item: item),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(
        endIndent: 8,
      ),
    );
  }
}
