import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_app/login.dart';
import 'package:twitter_app/profile.dart';
import 'package:twitter_app/starter.dart';
import 'package:twitter_app/signup.dart';
import 'models/user_model.dart';
import 'user_auth/firebase_auth_services.dart';
class Wrapper extends StatefulWidget {
   static const routeName = '/';
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
   
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active){
          final User? user = snapshot.data;
          return user == null ? LoginScreen() : ProfileScreen();
        }
        else{
          return Scaffold(
            body: Center(child:  CircularProgressIndicator(),)
          );
        }
      },
    );
  }
}