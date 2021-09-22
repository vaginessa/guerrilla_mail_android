import 'package:guerrilla_mail_api/guerrilla_mail_api.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MessageAdapter extends TypeAdapter<Message> {
  @override
  final typeId = 1;

  @override
  Message read(BinaryReader reader) {
    var json = Map.from(reader.readMap())
        .map((key, value) => MapEntry(key.toString(), value));
    return Message.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, Message obj) {
    writer.writeMap(obj.toJson());
  }
}
