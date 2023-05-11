import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:we_link/models/chat/chat_list_response.dart';
import 'package:we_link/models/notification/notification_detail_response.dart';
import 'package:we_link/models/notification/notification_list_response.dart';
import 'package:we_link/views/main_screen.dart';

import '../../models/activity/history/get_activity_history_list_response.dart';
import '../../models/chat/chat_response.dart';

class MessageViewModel extends GetxController {
  Dio dio;

  MessageViewModel(this.dio);

  var loading = false.obs;

  final RxList<ChatResponse> _chatList = <ChatResponse>[].obs;

  List<ChatResponse> get chatList => _chatList.value;

  var notificationList = <Notification>[].obs;
  NotificationDetail? notificationDetail;

  @override
  void onReady() {
    super.onReady();
  }

  Future getActivityList() async {
    try {
      loading.value = true;

      await getNotificationList();

      var response = await dio.get('activities', queryParameters: {
        "status": "PROCESS",
      });
      var data = GetActivityHistoryListResponse.fromJson(response.data);
      var activityList = data.result ?? [];

      if (activityList.isNotEmpty == true) {
        getChatList(activityList.first);
      }
      loading.value = false;
    } on DioError {
      loading.value = false;
    }
  }

  Future getNotificationList() async {
    try {
      var response = await dio.get('notifications');
      var data = NotificationListResponse.fromJson(response.data);
      notificationList.value = data.result ?? [];

      var unread = 0;
      notificationList.value.forEach((element) {
        if (element.seen == null) {
          unread = unread + 1;
        }
      });

      MainViewModel mainViewModel = Get.find();
      mainViewModel.totalNotification.value = unread;
    } on DioError {
      loading.value = false;
    }
  }

  getChatList(ActivityList activityList) {
    List<ChatListResponse> chatList = [];
    FirebaseFirestore.instance
        .collection('Activities')
        .orderBy('updatedAt', descending: true)
        .get()
        .then((value) {
      for (var element in value.docs) {
        var items = ChatListResponse.fromJson(element.data());
        chatList.add(items);
      }

      List<ChatListResponse> temp = [];

      if (chatList.first.id == activityList.id) {
        temp.addAll(chatList
            .where((element) => element.id.toString() == activityList.id.toString())
            .toList());

        if (temp.isNotEmpty == true) {
          if (temp.first.status != 'SUCCESS' || temp.first.status != 'CANCEL') {
            _chatList.bindStream(getMessageList(temp.first.id ?? -1));
          }
        }
      }
    });
  }

  Stream<List<ChatResponse>> getMessageList(num activityId) {
    return FirebaseFirestore.instance
        .collection('Activities/$activityId/Chats')
        .orderBy('createdAt', descending: true)
        .limit(1)
        .snapshots()
        .map((QuerySnapshot event) {
      List<ChatResponse> messageList = [];
      for (var element in event.docs) {
        var items = ChatResponse.fromJson(element.data())
          ..activityId = activityId;
        messageList.add(items);
      }
      return messageList;
    });
  }

  Future removeNotification(Notification item) async {
    await dio.delete('notifications/${item.id ?? -1}');

    await getNotificationList();
  }

  Future updateNotification(Notification item) async {
    var response = await dio.get('notifications/${item.id ?? -1}');
    var data = NotificationDetailResponse.fromJson(response.data);
    notificationDetail = data.result;

    await getNotificationList();
  }
}
