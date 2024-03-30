import 'package:flutter/material.dart';
import 'package:selection/src/selection_feature/feature_friend.dart';
import 'package:selection/src/selection_feature/feature_item.dart';

class FeatureItemDetailsView extends StatelessWidget {
  const FeatureItemDetailsView({super.key});
  // FeatureItem item;

  static const routeName = '/feature_item';

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final item = FeatureItem(arguments['id'], arguments['title']);

    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Center(
        child: // if item.title == "친구 추첨"
            item.title == "친구 추첨"
                ? const FriendSelectionView()
                : item.title == "랜덤"
                    ? const Text('랜덤을 선택하셨습니다.')
                    : const Text('추가 예정입니다.'),
      ),
    );
  }
}
