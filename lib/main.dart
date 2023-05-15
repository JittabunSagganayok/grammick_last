import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:we_link/di/app_module.dart';
import 'package:we_link/routes/app_route.dart';
import 'package:we_link/views/auth/splash_screen.dart';
import 'firebase_options.dart';

import 'package:we_link/marketplace/pages/marketplace.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  if (message.data != null) {}
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await [
    Permission.camera,
    Permission.storage,
    Permission.photos,
    Permission.location,
  ].request();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  await dotenv.load(fileName: 'assets/.env.dart');
  await AppModule().provideModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: GetMaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        getPages: AppRoute().screens,
        home: MaterialApp(
          title: 'we link',
          debugShowCheckedModeBanner: false,
          //home: SplashScreen(),
          home: MarketHomeScreen(),
        ),
      ),
    );
  }
}
