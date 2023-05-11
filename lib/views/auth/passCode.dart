import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';

class passCode extends StatefulWidget {
  passCode({Key? key}) : super(key: key);

  @override
  State<passCode> createState() => _passCodeState();
}

class _passCodeState extends State<passCode> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();

  bool isAuthenticated = false;
  var storedPasscode = '123456';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 90,
          ),
          _defaultLockScreenButton(context),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, right: 10),
                child: Image.asset(
                  'assets/images/en.png',
                  fit: BoxFit.fill,
                  height: 40,
                  width: 40,
                ),
              ),
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width *
                                            0.35,
                        child: Text(
                          'Specify PINjkjkjkjkjkkjkjkjkjkjkkj',
                          // textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'Specify ',
                        // textAlign: TextAlign.center,
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 60),
                child: Image.asset(
                  'assets/images/arrowD.png',
                  fit: BoxFit.fill,
                  color: Colors.amber,
                  height: 20,
                  width: 25,
                ),
              )
            ],
          )
          // _customColorsLockScreenButton(context)
        ],
      ),
    );
  }

  _defaultLockScreenButton(BuildContext context) => MaterialButton(
        color: Theme.of(context).primaryColor,
        child: Text('Open Default Lock Screen'),
        onPressed: () {
          _showLockScreen(
            context,
            opaque: false,
            cancelButton: Text(
              'Cancel',
              style: const TextStyle(fontSize: 16, color: Colors.white),
              semanticsLabel: 'Cancel',
            ),
          );
        },
      );

  _showLockScreen(
    BuildContext context, {
    required bool opaque,
    CircleUIConfig? circleUIConfig,
    KeyboardUIConfig? keyboardUIConfig,
    required Widget cancelButton,
    List<String>? digits,
  }) {
    Navigator.push(
        context,
        PageRouteBuilder(
          opaque: opaque,
          pageBuilder: (context, animation, secondaryAnimation) => Container(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bgSignin.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: PasscodeScreen(
              title: Column(
                children: [
                  Text(
                    'Specify PIN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),

                  // Text(
                  //     'Enter App Passcode',
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(color: Colors.white, fontSize: 28),
                  // ),
                ],
              ),
              circleUIConfig: circleUIConfig,
              keyboardUIConfig: KeyboardUIConfig(
                  digitBorderWidth: 1,
                  // keyboardSize: Size(350,30),
                  // digitInnerMargin: EdgeInsets.all(100),
                  digitTextStyle: TextStyle(
                      fontSize: 18,
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold),
                  keyboardRowMargin: EdgeInsets.only(right: 20)),
              passwordEnteredCallback: _onPasscodeEntered,
              cancelButton: cancelButton,
              deleteButton: Text(
                'Delete',
                style: const TextStyle(fontSize: 16, color: Colors.white),
                semanticsLabel: 'Delete',
              ),
              shouldTriggerVerification: _verificationNotifier.stream,
              backgroundColor: Colors.black.withOpacity(0.4),
              cancelCallback: _onPasscodeCancelled,
              digits: digits,
              passwordDigits: 6,
              bottomWidget: _buildPasscodeRestoreButton(),
            ),
          ),
        ));
  }

  _onPasscodeEntered(String enteredPasscode) {
    bool isValid = storedPasscode == enteredPasscode;
    _verificationNotifier.add(isValid);
    if (isValid) {
      setState(() {
        this.isAuthenticated = isValid;
      });
    }
  }

  _onPasscodeCancelled() {
    Navigator.maybePop(context);
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }

  _buildPasscodeRestoreButton() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10.0, top: 20.0),
          child: TextButton(
            onPressed: () {  },
            child: Text(
              "Reset passcode",
              textAlign: TextAlign.left,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
            // onPressed: _resetAppPassword,
            // splashColor: Colors.white.withOpacity(0.4),
            // highlightColor: Colors.white.withOpacity(0.2),
            // ),
          ),
        ),
      );
}
