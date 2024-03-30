import 'dart:math';
import 'package:flutter/material.dart';

class FriendSelectionView extends StatefulWidget {
  const FriendSelectionView({super.key});

  @override
  FriendSelectionViewState createState() => FriendSelectionViewState();
}

class FriendSelectionViewState extends State<FriendSelectionView> {
  final List<String> _friends = [];
  final TextEditingController _friendController = TextEditingController();
  String? _selectedFriend;

  void _drawFriend() {
    if (_friends.isEmpty) return;
    final random = Random();
    setState(() {
      _selectedFriend = _friends[random.nextInt(_friends.length)];
    });
  }

  void _addFriend() {
    if (_friendController.text.isNotEmpty) {
      setState(() {
        _friends.add(_friendController.text);
        _friendController.clear();
      });
    }
  }

  @override
  void dispose() {
    _friendController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _friendController,
            decoration: InputDecoration(
              labelText: '친구 이름 입력',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              suffixIcon: IconButton(
                icon: Icon(Icons.add, color: Theme.of(context).primaryColor),
                onPressed: _addFriend,
              ),
            ),
            onSubmitted: (_) => _addFriend(),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _drawFriend,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColorDark,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text('친구 추첨하기', style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 20),
          Text(
            _selectedFriend == null ? '추첨을 시작하세요!' : '$_selectedFriend 당첨!',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 24, color: Theme.of(context).colorScheme.secondary),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: _friends.isNotEmpty
                ? ListView.separated(
                    itemCount: _friends.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        title: Text(_friends[index]),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline,
                              color: Colors.redAccent),
                          onPressed: () {
                            setState(() {
                              _friends.removeAt(index);
                            });
                          },
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                  )
                : Center(
                    child: Text(
                      '친구 목록이 비어 있습니다.',
                      style: TextStyle(
                          color: Colors.grey[600], fontStyle: FontStyle.italic),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
