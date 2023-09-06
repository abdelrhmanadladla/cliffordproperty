import 'package:cliffordproperty/Models/UserModel.dart';

class ChatModel {
  String id;
  UserModel user;
  String messageText;
  DateTime timeSent;

  ChatModel({
    required this.id,
    required this.user,
    required this.messageText,
    required this.timeSent,
  });
}
