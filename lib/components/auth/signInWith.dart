import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:we_link/constant/stylesConstants.dart';

import '../../firebase_options.dart';

class SocialLoginButton extends StatefulWidget {
  @override
  State<SocialLoginButton> createState() => _SocialLoginButtonState();
}

class _SocialLoginButtonState extends State<SocialLoginButton> {
  final FacebookLogin facebookSignIn = new FacebookLogin();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: DefaultFirebaseOptions.currentPlatform.iosClientId,
    scopes: <String>['email'],
  );

  @override
  void initState() {
    super.initState();

    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) async {
      GoogleSignInAuthentication? user = await account?.authentication;
      String loginToken = user?.idToken ?? "";
      print("GoogleSignInAccount = ${loginToken.toString()}");
    });

    _googleSignIn.disconnect();
    _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 23, top: 69),
          child: Text(
            'sign in with',
            style: signInWithText,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                _loginWithGoogle();
              },
              iconSize: 50,
              icon: Image.asset('assets/images/Google.png'),
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {},
              iconSize: 50,
              icon: Image.asset('assets/images/Apple ID.png'),
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {
                _loginWithFacebook();
              },
              iconSize: 50,
              icon: Image.asset('assets/images/Facebook.png'),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _loginWithGoogle() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<Null> _loginWithFacebook() async {
    await facebookSignIn.logOut();

    final FacebookLoginResult result = await facebookSignIn.logIn(customPermissions: [
      FacebookPermission.email.name,
      FacebookPermission.publicProfile.name,
    ]);

    switch (result.status) {
      case FacebookLoginStatus.success:
        print("FacebookLoginStatus = ${FacebookLoginStatus.success.toString()}");
        final FacebookAccessToken? accessToken = result.accessToken;
        // _handleLoginWithSocial(accessToken.token, LoginConstant.facebook);
        break;
      case FacebookLoginStatus.cancel:
        print("FacebookLoginStatus = ${FacebookLoginStatus.cancel.toString()}");
        break;
      case FacebookLoginStatus.error:
        print("FacebookLoginStatus = ${FacebookLoginStatus.error.toString()}");
        break;
    }
  }
}
