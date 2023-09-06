import 'package:cached_network_image/cached_network_image.dart';
import 'package:cliffordproperty/Models/ChatModel.dart';
import 'package:cliffordproperty/Models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ChattingScreen extends StatefulWidget {
  final UserModel user;
  const ChattingScreen({required this.user, super.key});

  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
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

  UserModel me = UserModel(
    id: 'MyUser',
    userName: 'Me',
    userProfileImage:
        'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1985&q=80',
  );
  late List<ChatModel> chats = List.generate(
          7,
          (index) => ChatModel(
              id: '$index',
              user: index < 5 ? me : widget.user,
              messageText: 'This is test message number ${index + 1}',
              timeSent: DateTime.now().subtract(Duration(hours: index))))
      .reversed
      .toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEDEDED),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 16.w, left: 16.w, top: 50.h),
            child: Row(
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.arrow_back_ios, size: 32.h),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                SizedBox(width: 34.w),
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: CachedNetworkImage(
                    imageUrl: widget.user.userProfileImage,
                    width: 64.w,
                  ),
                ),
                SizedBox(width: 16.w),
                Text(
                  widget.user.userName,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              reverse: true,
              itemBuilder: (context, index) {
                bool notSentByMe = widget.user == chats[index].user;
                var dateFormat = DateFormat("hh:mm aa");
                var utcDate = dateFormat.format(chats[index].timeSent);
                var localDate =
                    dateFormat.parse(utcDate, true).toLocal().toString();
                String createdDate =
                    dateFormat.format(DateTime.parse(localDate));
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: Column(
                    crossAxisAlignment: notSentByMe
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: notSentByMe
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                        children: [
                          notSentByMe
                              ? Container(
                                  clipBehavior: Clip.antiAlias,
                                  margin: EdgeInsetsDirectional.only(end: 16.w),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        chats[index].user.userProfileImage,
                                    width: 32.w,
                                  ),
                                )
                              : const SizedBox.shrink(),
                          Container(
                            width: 166.w,
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 16.w),
                            decoration: BoxDecoration(
                              color: notSentByMe
                                  ? Colors.white
                                  : const Color(0xff474EFC),
                              borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(12.r),
                                topEnd: Radius.circular(12.r),
                                bottomStart: notSentByMe
                                    ? Radius.zero
                                    : Radius.circular(12.r),
                                bottomEnd: notSentByMe
                                    ? Radius.circular(12.r)
                                    : Radius.zero,
                              ),
                            ),
                            child: Wrap(children: [
                              Text(
                                chats[index].messageText,
                                style: TextStyle(
                                  color: notSentByMe
                                      ? const Color(0xff645959)
                                      : Colors.white,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ]),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        width: 220.w,
                        alignment: AlignmentDirectional.bottomEnd,
                        child: Text(
                          createdDate,
                          style: TextStyle(
                              fontSize: 10.sp, color: const Color(0xff7F7F7F)),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 8.h),
              itemCount: chats.length,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                bottom: 50.h, right: 16.h, left: 16.w, top: 8.h),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (value) {
                      _preformAction();
                    },
                    decoration: InputDecoration(
                      filled: true,
                      hintText: appLocale.typeAMessage,
                      fillColor: Colors.white,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                IconButton(
                  icon: Container(
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.send,
                      size: 16.h,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: _preformAction,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _preformAction() {
    chats = chats.reversed.toList();
    chats.add(ChatModel(
        id: 'id',
        user: me,
        messageText: _controller.text,
        timeSent: DateTime.now()));

    chats = chats.reversed.toList();
    _controller.clear();
    setState(() {});
  }
}
