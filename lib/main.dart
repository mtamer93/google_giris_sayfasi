import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'google_sign_in.dart';
import 'homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyC9hKWpHybYQgp3EEubNenohwNWPAi1LVM',
          appId: '1:382363245456:android:bce2cb59a51e1356c13115',
          messagingSenderId: '382363245456',
          projectId: 'giris-sayfasi-a5769'));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInDemo(),
    );
  }
}

class SignInDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Sign-In Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final GoogleSignInProvider googleSignInProvider =
                GoogleSignInProvider();
            final User? user = await googleSignInProvider.signInWithGoogle();

            if (user != null) {
              print('User signed in: ${user.displayName}');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(
                            user: user,
                          )));
            } else {
              print('Sign-in failed');
            }
          },
          child: Text('Sign in with Google'),
        ),
      ),
    );
  }
}
