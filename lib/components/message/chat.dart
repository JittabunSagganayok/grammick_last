import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as http;
import 'package:extended_image/extended_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';
import 'package:we_link/components/message/callOut.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';

import '../../models/activity/we-ride/we_ride_activity_response.dart';
import '../../models/chat/chat_response.dart';
import '../../models/profile/user_profile_response.dart';
import '../../views/auth/createProfile.dart';
import '../alert/chatAutoAlert.dart';

class ChatListScreen extends StatefulWidget {
  num? activityId;

  ChatListScreen({
    this.activityId = -1,
  });

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends AppState<ChatListScreen, ChatListViewModel> {
  final chatInputTextController = TextEditingController();

  bool typing = false;

  @override
  ChatListViewModel initViewModel(ChatListViewModel viewModel) {
    viewModel.setActivityId(widget?.activityId ?? -1);
    viewModel.getProfile();
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, ChatListViewModel viewModel) {
    return Obx(() {
      if (viewModel.loading.value == true) {
        return LoadingFullscreen();
      } else {
        return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: AppBar(
                backgroundColor: blackColor,
                automaticallyImplyLeading: false,
                elevation: 0,
                shape: appbarBorder,
                leading: Container(
                  margin: EdgeInsets.only(left: 5),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Image.asset('assets/images/goBack.png'),
                  ),
                ),
                centerTitle: true,
                title: Text(
                  '${viewModel.chatList.last.senderBy?.name} ${viewModel.chatList.last.senderBy?.lastname}',
                  style: titleWhiteAppbar,
                ),
                actions: [
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: IconButton(
                      onPressed: () async {
                        await launchUrl(Uri.parse(
                            'tel:${viewModel.activityResponse.value.result?.driver?.phone ?? ""}'));
                      },
                      icon: Image.asset(
                        'assets/images/phone.png',
                        width: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(bottom: 15, left: 20),
                  child: Text('Typing…',
                      style: TextStyle(
                        color: Color(0xFF272727),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Kanit',
                        fontSize: 13,
                      )),
                ),
                Container(
                    decoration: containerDecoration,
                    child: Container(
                        margin: EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 30),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                chatAutoAlert(context, (message) {
                                  chatInputTextController.text = message;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 15),
                                child: Image.asset(
                                  'assets/images/set.png',
                                  fit: BoxFit.fitWidth,
                                  height: 21,
                                  width: 26,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              child: InkWell(
                                onTap: () async {
                                  var pickFile = await FilePicker.platform
                                      .pickFiles(
                                          type: FileType.image,
                                          allowMultiple: false);

                                  if (pickFile != null) {
                                    viewModel.uploadImage(
                                        pickFile.files.first.path ?? "");
                                  }
                                },
                                child: Image.asset(
                                  'assets/images/file.png',
                                  fit: BoxFit.fitWidth,
                                  height: 21,
                                  width: 26,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height: 37,
                                  child: TextFormField(
                                    onTap: () {
                                      setState(() {
                                        typing = !typing;
                                      });
                                    },
                                    autofocus: false,
                                    controller: chatInputTextController,
                                    style: fieldSearchText,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: 'พิมพ์ข้อความ..',
                                      fillColor: Color(0xFFEEEEEE),
                                      filled: true,
                                      hintStyle: fieldSearchHintText,
                                      contentPadding: fieldSearchPadding,
                                      enabledBorder: fieldSearchBorder,
                                      focusedBorder: fieldSearchBorder,
                                    ),
                                  )),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15),
                              child: InkWell(
                                onTap: () async {
                                  if (viewModel.isSending) {
                                    return;
                                  }

                                  if (chatInputTextController.text.isEmpty == true) {
                                    Get.defaultDialog(
                                      title: 'ขออภัย',
                                      content: const Text('คุณยังไม่ได้ระบุข้อความ'),
                                    );
                                    return;
                                  }

                                  viewModel.isSending = true;

                                  await viewModel.addNewMessage(
                                    text: chatInputTextController.text.trimLeft().trimRight(),
                                    type: ChatType.MESSAGE,
                                  );

                                  chatInputTextController.clear();
                                  viewModel.isSending = false;
                                },
                                child: Image.asset(
                                  'assets/images/send.png',
                                  fit: BoxFit.fitWidth,
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ),
                          ],
                        )))
              ],
            ),
            body: Container(
                child: SingleChildScrollView(
                  child: Column(
              children: [
                  Container(
                    margin: const EdgeInsets.only(top: 24),
                    child: Builder(builder: (context) {
                      var format =
                          DateFormat('EEE, HH:mm aaa').format(DateTime.now());
                      return Text(format, style: dateChatText);
                    }),
                  ),
                  Obx(() => ListView.separated(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 16,
                        ),
                        shrinkWrap: true,
                        primary: false,
                        itemCount: viewModel.chatList.length,
                        reverse: true,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Divider(
                          height: 16,
                          color: Colors.transparent,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          var item = viewModel.chatList[index];
                          var isOwnerMessage = item.senderBy?.id == viewModel.userProfileResponse.value?.id;
                          return Builder(builder: (context) {
                            if (isOwnerMessage) {
                              return createOwnerMessage(item);
                            } else {
                              return createDriverMessage(item);
                            }
                          });
                        },
                      )),
              ],
            ),
                )));
      }
    });
  }

  Widget createOwnerMessage(ChatResponse item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Builder(builder: (context) {
                  if (item.type == 'MESSAGE') {
                    return Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xff353535),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        item.result ?? "",
                        style: GoogleFonts.kanit(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                    );
                  } else {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: ExtendedImage.network(
                          item.result ?? "",
                          width: 200,
                        ));
                  }
                }),
                const SizedBox(
                  height: 4,
                ),
                Builder(builder: (context) {
                  var time = item.createdAt;
                  return Text(
                    timeago.format(time?.toDate() ?? DateTime.now()),
                    style: GoogleFonts.kanit(
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                        color: Color(0xff545353)),
                  );
                }),
              ],
            ),
            SizedBox(
              width: 16,
            ),
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                item.senderBy?.picture ?? "",
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget createDriverMessage(ChatResponse item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                item.senderBy?.picture ?? "",
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Builder(builder: (context) {
                  if (item.type == 'MESSAGE') {
                    return Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5F5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        item.result ?? "",
                        style: GoogleFonts.kanit(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff343434)),
                      ),
                    );
                  } else {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: ExtendedImage.network(
                          item.result ?? "",
                          width: 200,
                        ));
                  }
                }),
                const SizedBox(
                  height: 4,
                ),
                Builder(builder: (context) {
                  var time = item.createdAt;
                  return Text(
                    timeago.format(time?.toDate() ?? DateTime.now()),
                    style: GoogleFonts.kanit(
                        fontSize: 12,
                        fontWeight: FontWeight.w200,
                        color: Color(0xff545353)),
                  );
                }),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class ChatListViewModel extends GetxController {
  ChatListViewModel(this.dio);

  var loading = false.obs;

  Dio dio;

  num? activityId;

  final _chatList = <ChatResponse>[].obs;

  List<ChatResponse> get chatList => _chatList.value;

  var userProfileResponse = Profile().obs;
  var activityResponse = WeRideActivityResponse().obs;

  @override
  void onReady() {
    super.onReady();
    _chatList.bindStream(getMessageList(activityId ?? -1));
  }

  Future getProfile() async {
    loading.value = true;
    var response = await Future.wait([
      dio.get('auth/profile'),
      dio.get('activities/$activityId'),
    ]);

    var data = UserProfileResponse.fromJson(response[0].data);
    userProfileResponse.value = data.result!;

    activityResponse.value = WeRideActivityResponse.fromJson(response[1].data);

    loading.value = false;
  }

  void setActivityId(num activityId) {
    this.activityId = activityId;
  }

  Stream<List<ChatResponse>> getMessageList(num activityId) {
    return FirebaseFirestore.instance
        .collection('Activities/$activityId/Chats')
        .orderBy('createdAt', descending: true)
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


  var isSending = false;

  Future addNewMessage({
    String? text,
    ChatType? type,
  }) async {
    Map<String, dynamic> senderBy = {
      "id": userProfileResponse.value.id,
      "name": userProfileResponse.value.name,
      "lastname": userProfileResponse.value.lastname,
      "picture": userProfileResponse.value.picture
    };

    Map<String, dynamic> request = {
      "SenderBy": senderBy,
      "active": true,
      "createdAt": FieldValue.serverTimestamp(),
      "result": text,
      "type": type == ChatType.MESSAGE ? "MESSAGE" : "IMAGE",
    };

    var _firebaseFirestore = FirebaseFirestore.instance;
    DocumentReference messagesReference = _firebaseFirestore
        .collection('Activities')
        .doc(activityId.toString())
        .collection('Chats')
        .doc();

    await _firebaseFirestore.runTransaction((transaction) async {
      transaction.set(messagesReference, request);
    });
  }

  Future uploadImage(
    String? filePath,
  ) async {
    var image = http.FormData.fromMap({
      'picture': await http.MultipartFile.fromFile(filePath ?? ""),
    });

    var response = await dio.post('upload/one?withUrl=1', data: image);
    var uploadResult = UploadImageResult.fromJson(response.data);

    addNewMessage(
      text: uploadResult.result ?? "",
      type: ChatType.IMAGE,
    );
  }
}

enum ChatType { MESSAGE, IMAGE }
