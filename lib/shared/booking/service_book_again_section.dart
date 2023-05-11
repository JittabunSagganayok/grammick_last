import 'package:flutter/material.dart';

import '../text/title_header_section.dart';
import 'item_service_book_again_widget.dart';

class ServiceBookAgainSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: TitleHeaderSection(
              title: 'Book again',
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              return ItemServiceBookAgainWidget(
                showBadge: true,
              );
            },
            separatorBuilder: (context, index) => const Divider(
              height: 16,
              color: Colors.transparent,
            ),
            itemCount: 2,
          ),
          const SizedBox(height: 32)
        ],
      ),
    );
  }
}
