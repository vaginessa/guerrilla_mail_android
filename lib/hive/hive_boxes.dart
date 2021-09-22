import 'package:guerrilla_mail_api/guerrilla_mail_api.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'message_adapter.dart';

class HiveBoxes {
  static Future<void> initialize() async {
    Hive.registerAdapter(MessageAdapter());
    messages = await Hive.openBox('messages');
  }

  HiveBoxes._();

  static late final Box<Message> messages;
}
