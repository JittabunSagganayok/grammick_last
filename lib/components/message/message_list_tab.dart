import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/di/app_module.dart';
import 'package:we_link/views/chat/message_viewmodel.dart';

import 'chat.dart';

class MessageListTab extends StatefulWidget {
  MessageListTab({Key? key}) : super(key: key);

  @override
  State<MessageListTab> createState() => _MessageListTabState();
}

class _MessageListTabState extends State<MessageListTab> {
  var viewModel = appModule.get<MessageViewModel>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: viewModel,
        builder: (MessageViewModel viewModel) {
          return Container(
            child: Column(
              children: [
                SizedBox(height: 16,),
                Obx(() => ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) {
                        final item = viewModel.chatList[index];
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(ChatListScreen(
                                  activityId: item.activityId ?? -1,
                                ));
                              },
                              child: SwipeActionCell(
                                key: ValueKey(index),
                                trailingActions: <SwipeAction>[
                                  SwipeAction(
                                      content: Container(
                                          width: 61,
                                          height: 36,
                                          decoration: buttonDelete,
                                          child: Center(
                                            child: Text(
                                              'Delete',
                                              style: deleteText,
                                            ),
                                          )),
                                      onTap: (CompletionHandler handler) async {
                                        // handler(false);
                                        // dataChat.removeAt(i);
                                        // setState(() {});
                                      },
                                      color: Colors.transparent),
                                ],
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: Image.asset(
                                          'assets/images/chat.png',
                                          fit: BoxFit.fill,
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 13,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text.rich(
                                                    TextSpan(
                                                      text:
                                                          '${item?.senderBy?.name} ${item?.senderBy?.lastname}',
                                                      style: dataListTitleText,
                                                    ),
                                                  ),
                                                ),
                                                item?.active == true
                                                    ? Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                          top: 1,
                                                        ),
                                                        decoration:
                                                            notDecoration,
                                                        constraints:
                                                            notiConstraints,
                                                        child: Text(
                                                          '1',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 8,
                                                          ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      )
                                                    : Container(),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text.rich(
                                                    TextSpan(
                                                      text: item.result
                                                          ?.toString(),
                                                      style:
                                                          dataListSubTitleText,
                                                    ),
                                                  ),
                                                ),
                                                Builder(builder: (context) {
                                                  var time = item.createdAt;
                                                  return Text(
                                                    timeago.format(
                                                        time?.toDate() ??
                                                            DateTime.now()),
                                                    style: dataListSubTitleText,
                                                  );
                                                })
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        );
                      },
                      itemCount: viewModel.chatList.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(
                        height: 16,
                        color: Colors.transparent,
                      ),
                    ))
              ],
            ),
          );
        });
  }
}
