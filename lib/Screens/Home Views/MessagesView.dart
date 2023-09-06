import 'package:cached_network_image/cached_network_image.dart';
import 'package:cliffordproperty/Helpers/Nav_Helper.dart';
import 'package:cliffordproperty/Models/MessageModel.dart';
import 'package:cliffordproperty/Models/UserModel.dart';
import 'package:cliffordproperty/Screens/ChattingScreen.dart';
import 'package:cliffordproperty/Widgets/MySearchBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class MessagesView extends StatefulWidget {
  const MessagesView({super.key});

  @override
  State<MessagesView> createState() => _MessagesViewState();
}

class _MessagesViewState extends State<MessagesView> with Nav_Helper {
  AppLocalizations get appLocale => AppLocalizations.of(context)!;
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  List<MessageModel> messages = List.generate(
      100,
      (index) => MessageModel(
          latestMessage: 'This is message number ${index + 1}',
          user: UserModel(
            id: '$index',
            userName: 'userNum ${index + 1}',
            userProfileImage:
                'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1985&q=80',
          ),
          timeStamp: DateTime.now().subtract(Duration(hours: index)),
          numOfUnreadMessages: index + 1));
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:
              EdgeInsets.only(left: 16.w, right: 16.w, top: 50.h, bottom: 14.h),
          color: const Color(0xffFFC7A5),
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios, size: 32.h),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(width: 95.w),
                  Text(
                    appLocale.messages,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: 34.h),
              MySearchBar(
                hasPadding: false,
                hasTrailing: false,
                controller: _controller,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              var dateFormat = DateFormat("hh:mm aa");
              var utcDate = dateFormat.format(messages[index].timeStamp);
              var localDate =
                  dateFormat.parse(utcDate, true).toLocal().toString();
              String createdDate = dateFormat.format(DateTime.parse(localDate));
              return GestureDetector(
                onTap: () =>
                    jump(context, ChattingScreen(user: messages[index].user)),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xffDDE1E2),
                          width: 4.w,
                        ),
                      ),
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: messages[index].user.userProfileImage,
                          height: 64.h,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          messages[index].user.userName,
                          style: TextStyle(
                              fontSize: 16.sp, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          messages[index].latestMessage,
                          style: TextStyle(
                              fontSize: 10.sp, color: const Color(0xff7F7F7F)),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          (messages[index].timeStamp.day ==
                                      DateTime.now().day &&
                                  messages[index].timeStamp.hour ==
                                      DateTime.now().hour &&
                                  messages[index].timeStamp.minute ==
                                      DateTime.now().minute)
                              ? 'just now'
                              : createdDate,
                        ),
                        SizedBox(height: 8.h),
                        CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          radius: 12.h,
                          child: Text(
                            '${messages[index].numOfUnreadMessages > 99 ? '99+' : messages[index].numOfUnreadMessages}',
                            style:
                                TextStyle(color: Colors.white, fontSize: 10.sp),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 16.w),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
              height: 32.h,
              indent: 45.w,
              endIndent: 45.w,
            ),
            itemCount: messages.length,
          ),
        )
      ],
    );
  }
}
