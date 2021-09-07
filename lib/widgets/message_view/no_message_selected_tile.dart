import 'package:flutter/material.dart';

class NoMessageSelectedTile extends StatelessWidget {
  const NoMessageSelectedTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ListTile(
        leading: Icon(Icons.info),
        title: Text('No message selected.'),
        subtitle: Text('Please tap on a message in the list.'),
      ),
    );
  }
}
