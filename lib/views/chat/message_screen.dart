import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:we_link/components/message/message_list_tab.dart';
import 'package:we_link/components/message/notification_list_tab.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/constant/stylesConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';
import 'package:we_link/views/chat/message_viewmodel.dart';
import 'package:we_link/views/main_screen.dart';

class MessageScreen extends StatefulWidget {
  MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends AppState<MessageScreen, MessageViewModel> {
  var indexSelect = 0;
  var titleName = [
    {'title': 'Chat'},
    {'title': 'Notification'}
  ];

  void clickSelects(i) {
    setState(() {
      indexSelect = i;
    });

    print(indexSelect);
    print(i);
  }

  @override
  MessageViewModel initViewModel(MessageViewModel viewModel) {
    viewModel.getActivityList();
    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, MessageViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: blackColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          leading: Container(
            margin: EdgeInsets.only(left: 5),
            child: IconButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              },
              icon: Image.asset('assets/images/goBack.png'),
            ),
          ),
          title: Text(
            'Notification',
            style: titleWhiteAppbar,
          )),
      body: Obx(() {
        if (viewModel.loading.value == true) {
          return LoadingFullscreen();
        } else {
          return Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: 110,
                child: Stack(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: 110,
                        decoration: BoxDecoration(
                          color: yellDarkColor,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(40),
                          ),
                        ),
                        child: Container(
                            margin: EdgeInsets.only(top: 55),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (var i = 0; i < titleName.length; i++)
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => clickSelects(i),
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 2),
                                            color: yellDarkColor,
                                            padding: EdgeInsets.only(
                                                right: 20, left: 20, top: 5),
                                            child: Text(
                                              '${titleName[i]['title']}',
                                              style: TextStyle(
                                                  color: indexSelect == i
                                                      ? Color(0xFF070707)
                                                      : Color(0xFF9F7315),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w800,
                                                  fontFamily: 'Kanit'),
                                            ),
                                          ),
                                          indexSelect == i
                                              ? CircleAvatar(
                                                  radius: 3.5,
                                                  backgroundColor: Colors.black,
                                                )
                                              : Container()
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ))),
                    Positioned(
                      right: 0,
                      left: 0,
                      top: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 1,
                        height: 24,
                        decoration: BoxDecoration(
                          color: blackColor,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: Column(
                      children: [
                        indexSelect == 0
                            ? MessageListTab()
                            : NotificationListTab()
                      ],
                    )),
              ))
            ],
          );
        }
      }),
    );
  }
}
