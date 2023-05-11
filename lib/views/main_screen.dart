import 'dart:io';

import 'package:dio/dio.dart';
import 'package:extended_image/extended_image.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:we_link/constant/colosrConstants.dart';
import 'package:we_link/feature/base/base_we_state.dart';
import 'package:we_link/shared/loading/loading_fullscreen.dart';
import 'package:we_link/views/chat/message_screen.dart';
import 'package:we_link/views/home_screen.dart';
import 'package:we_link/views/my_activity_screen.dart';
import 'package:we_link/views/my_profile_screen.dart';

import '../models/activity/history/get_activity_history_list_response.dart';
import '../models/error/error_response.dart';
import '../models/notification/notification_list_response.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key, this.valueSelectedIndex}) : super(key: key);
  final int? valueSelectedIndex;

  @override
  State<MainScreen> createState() => _MainScreenState(valueSelectedIndex);
}

class _MainScreenState extends AppState<MainScreen, MainViewModel> {
  _MainScreenState(int? _valueSelectedIndex) {
    valueSelectedIndex = _valueSelectedIndex;
  }

  int? valueSelectedIndex;
  SnakeShape snakeShape = SnakeShape.circle;

  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MyActivityScreen(),
    MessageScreen(),
    MyProfileScreen()
  ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  void _onItemTapped(int index) {
    if (valueSelectedIndex == 3) {
      setState(() {
        valueSelectedIndex = index;
      });
    }
    if (index == 2 && _selectedIndex == 0) {
      setState(() {
        _selectedIndex = 2;
      });
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  final _localNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final noticeDetail = const NotificationDetails(
    iOS: DarwinNotificationDetails(),
    android: AndroidNotificationDetails(
      'com.welink.app',
      'Welink',
      icon: 'assets/ic_launcher.png',
    ),
  );

  setup() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );
    await _localNotificationsPlugin.initialize(initializationSettings);
  }

  @override
  MainViewModel initViewModel(MainViewModel viewModel) {
    setup();
    viewModel.updateProfileError.listen((message) {
      /*
      Get.defaultDialog(
        title: 'Error',
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
      );*/
    });

    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    _firebaseMessaging
        .requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    )
        .then((settings) {
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
      } else {}

      final status = settings.authorizationStatus;
      if (status == AuthorizationStatus.authorized ||
          status == AuthorizationStatus.provisional) {
        _firebaseMessaging.getToken().then((token) {
          viewModel.updateDeviceToken(token ?? '');
        });

        _firebaseMessaging.getInitialMessage().then((message) {});

        FirebaseMessaging.onMessageOpenedApp.listen((message) async {
          printInfo(info: message.notification?.title ?? "");
        });

        FirebaseMessaging.onMessage.listen((RemoteMessage message) {
          var notificationMessage = message.notification;
          var title = notificationMessage?.title ?? "";
          var body = notificationMessage?.body ?? "";

          // display local notification]
          if (Platform.isAndroid) {
            showOverlayNotification(
              (context) {
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: SafeArea(
                    child: ListTile(
                      leading: SizedBox.fromSize(
                        size: const Size(40, 40),
                        child: Container(
                          child: ExtendedImage.asset('assets/ic_launcher.png'),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          clipBehavior: Clip.hardEdge,
                        ),
                      ),
                      title: Text(title,
                          maxLines: 1, overflow: TextOverflow.ellipsis),
                      subtitle: Text(body,
                          maxLines: 1, overflow: TextOverflow.ellipsis),
                      trailing: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          OverlaySupportEntry.of(context)?.dismiss();
                        },
                      ),
                    ),
                  ),
                );
              },
              duration: const Duration(milliseconds: 3000),
            );
          } else {
            _localNotificationsPlugin.show(
                notificationMessage.hashCode, title, body, noticeDetail);
          }
        });

        FirebaseMessaging.instance.onTokenRefresh.listen((token) {
          viewModel.updateDeviceToken(token ?? '');
        });
      }
    });

    return viewModel;
  }

  @override
  Widget onCreateView(BuildContext context, MainViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        if (viewModel.loading.value == true) {
          return LoadingFullscreen();
        } else {
          return Builder(builder: (context) {
            if (valueSelectedIndex == 3) {
              return MyProfileScreen();
            } else {
              return Center(
                child: _widgetOptions.elementAt(_selectedIndex),
              );
            }
          });
        }
      }),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: Platform.isAndroid ? 16 : 0),
        child: SnakeNavigationBar.color(
          height: 72,
          backgroundColor: blackColor,
          behaviour: SnakeBarBehaviour.floating,
          snakeShape: SnakeShape.indicator,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          snakeViewColor: blackColor,
          selectedItemColor: yellowColor,
          unselectedItemColor: Color(0xFFAAAAAA),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          currentIndex:
              valueSelectedIndex == 3 ? valueSelectedIndex! : _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/home.png'),
                size: 25,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Stack(
                    children: [
                      ImageIcon(
                        AssetImage('assets/images/Activities.png'),
                        size: 25,
                      ),
                      Obx(() {
                        if (viewModel.totalBadge.value > 0) {
                          return Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: EdgeInsets.only(
                                top: 1,
                              ),
                              decoration: new BoxDecoration(
                                color: Color(0xFFFB6756),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              constraints: BoxConstraints(
                                minWidth: 12,
                                minHeight: 12,
                              ),
                              child: Text(
                                viewModel.totalBadge.toString(),
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        } else {
                          return SizedBox(
                            width: 0,
                          );
                        }
                      }),
                    ],
                  ),
                ],
              ),
              label: 'Activities',
            ),
            BottomNavigationBarItem(
              icon: Column(
                children: [
                  Stack(
                    children: [
                      ImageIcon(
                        AssetImage('assets/images/Message.png'),
                        size: 25,
                      ),
                      Obx(() {
                        if (viewModel.totalNotification.value <= 0) {
                          return SizedBox(
                            height: 0,
                          );
                        }
                        return Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            padding: EdgeInsets.only(
                              top: 1,
                            ),
                            decoration: new BoxDecoration(
                              color: Color(0xFFFB6756),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            constraints: BoxConstraints(
                              minWidth: 12,
                              minHeight: 12,
                            ),
                            child: new Text(
                              viewModel.totalNotification.value.toString(),
                              style: new TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              ),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/images/profile.png'),
                size: 25,
              ),
              label: 'Profile',
            ),
          ],
          selectedLabelStyle: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'Kanit'),
          unselectedLabelStyle: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'Kanit'),
        ),
      ),
    );
  }
}

class MainViewModel extends GetxController {
  Dio dio;

  var totalBadge = 0.obs;
  var totalNotification = 0.obs;

  MainViewModel(this.dio);

  var updateProfileError = ''.obs;

  var loading = false.obs;

  Future updateDeviceToken(
    String token,
  ) async {
    Get.put(this);
    try {
      await dio.patch('users', data: {
        "device_token": token,
      });
      await getNotificationList();
      getActivityList();
    } on DioError catch (e) {
      var error = ErrorResponse.fromJson(e.response?.data);
      updateProfileError.value = error.message ?? "";
    }
  }

  Future getActivityList() async {
    try {
      var response = await dio.get(
        'activities',
      );
      var data = GetActivityHistoryListResponse.fromJson(response.data);
      var activityList = data.result ?? [];
      totalBadge.value = activityList
          .where((element) => element.status == 'BOOK')
          .toList()
          .length;
    } on DioError catch (e) {
      var error = ErrorResponse.fromJson(e.response?.data);
      var message = error.message ?? "";
      throw UnsupportedError(message);
    } finally {}
  }

  Future getNotificationList() async {
    try {
      loading.value = true;
      var response = await dio.get('notifications');
      var data = NotificationListResponse.fromJson(response.data);
      var notificationList = data.result ?? [];

      var unread = 0;
      for (var element in notificationList) {
        if (element.seen == null) {
          unread = unread + 1;
        }
      }

      totalNotification.value = unread;
      loading.value = false;
    } on DioError {
      loading.value = false;
    }
  }
}
