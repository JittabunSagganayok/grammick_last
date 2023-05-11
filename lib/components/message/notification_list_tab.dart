import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:we_link/components/message/notiDetail.dart';
import 'package:we_link/constant/stylesConstants.dart';

import '../../di/app_module.dart';
import '../../views/chat/message_viewmodel.dart';

class NotificationListTab extends StatefulWidget {
  NotificationListTab({Key? key}) : super(key: key);

  @override
  State<NotificationListTab> createState() => _NotificationListTabState();
}

class _NotificationListTabState extends State<NotificationListTab> {
  var viewModel = appModule.get<MessageViewModel>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: viewModel,
      builder: (MessageViewModel viewModel) {
        return Column(
          children: [
            SizedBox(height: 16,),
            Obx(() => ListView.separated(
              shrinkWrap: true,
              primary: false,
              itemCount: viewModel.notificationList.length,
              itemBuilder: (BuildContext context, int index) {
                final item = viewModel.notificationList[index];
                return GestureDetector(
                  onTap: () async {

                    await viewModel.updateNotification(item);

                    await Get.to(NotificationDetailScreen(viewModel.notificationDetail));
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
                            viewModel.removeNotification(item);
                          },
                          color: Colors.transparent),
                    ],
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        children: [
                          Container(
                            child: Image.asset(
                              'assets/images/chatNoti.png',
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text.rich(
                                        TextSpan(
                                          text: item.type ?? "",
                                          style: dataListTitleText,
                                        ),
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) {
                                        if (item.seen != null) {
                                          return SizedBox(height: 0,);
                                        }
                                        return CircleAvatar(
                                          radius: 4,
                                          backgroundColor: Color(0xFFFB6756),
                                        );
                                      }
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text.rich(
                                        TextSpan(
                                          text: item.title ?? "",
                                          style: dataListSubTitleText,
                                        ),
                                      ),
                                    ),
                                    Builder(builder: (context) {
                                      var time = DateTime.parse(
                                          item.createdAt ?? "");
                                      return Text(
                                        timeago.format(time),
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
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(
                height: 16,
                color: Colors.transparent,
              ),
            )),
          ],
        );
      },
    );
  }
}
