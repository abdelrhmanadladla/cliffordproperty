import 'package:cliffordproperty/Models/UserModel.dart';

class MessageModel {
  String latestMessage;
  UserModel user;
  DateTime timeStamp;
  int numOfUnreadMessages;

  MessageModel({
    required this.latestMessage,
    required this.user,
    required this.timeStamp,
    required this.numOfUnreadMessages,
  });
}
