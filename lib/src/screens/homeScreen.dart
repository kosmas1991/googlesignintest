import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoggedIn = false;
  GoogleSignInAccount _googleSignInAccount;
  GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('google sign in'),
        centerTitle: true,
      ),
      body: Container(
        child: _isLoggedIn?
        Column(
          children: [
            GoogleUserCircleAvatar(identity: _googleSignInAccount),
            Text(_googleSignInAccount.displayName),
            Text(_googleSignInAccount.email),
            ElevatedButton(onPressed: () {
              _googleSignIn.signOut().then((value) {
                setState(() {
                  _isLoggedIn = false;
                });
              }).catchError((e) {});
            }, child: Text('Log out')),
          ],
        ):
        Center(child: ElevatedButton(
          child: Text('Log in with google'),
          onPressed: () {
            _googleSignIn.signIn().then((value) {
              setState(() {
                _isLoggedIn = true;
                _googleSignInAccount = value;
              });
            }).catchError((e) {
              print('idiot tutorial');
            });
          },
        ),),
      ),
    );
  }
}
