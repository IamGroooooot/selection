import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'feature_item.dart';
import 'feature_item_details_view.dart';

class SelectionMenuView extends StatelessWidget {
  const SelectionMenuView({
    super.key,
    this.items = const [
      FeatureItem(1, "친구 추첨"),
      FeatureItem(2, "랜덤"),
      FeatureItem(3, "추가 예정")
    ],
  });

  static const routeName = '/';

  final List<FeatureItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('What to do?'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
          ],
        ),
        body: ListView(
          children: [
            for (final item in items)
              ListTile(
                title: Text(item.title),
                onTap: () {
                  Navigator.restorablePushNamed(
                      context, FeatureItemDetailsView.routeName,
                      arguments: {'id': item.id, 'title': item.title});
                },
              ),
          ],
        ));
  }
}
