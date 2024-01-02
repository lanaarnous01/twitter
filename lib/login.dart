import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_app/profile.dart';
import 'package:twitter_app/signup.dart';
import 'package:twitter_app/user_auth/firebase_auth_services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();

  //  final authService = Provider.of<AuthService>(context);

  @override
  Widget build(BuildContext context) {
     final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();

    final authService = Provider.of<AuthService>(context);
    return Scaffold(
    backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRs5CWs2T6mtzFxudcZHvgNEevFcm-JXPe4nw&usqp=CAU",
          height: 100,
          width: 100,
          ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8, right: 80),
                child: Text("Happening now",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                        ),
              ),

           Padding(
             padding: const EdgeInsets.only(top: 8.0, bottom: 8, right: 20),
             child: Text("Join today.",
                     style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold
                     ),
                     ),
           ),
          Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            style: TextStyle(color: Colors.white),
            controller: emailController,
  decoration: InputDecoration(
    hintText: 'Email',
   hintStyle: TextStyle(color: Colors.white),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 3, color: Colors.white), //<-- SEE HERE
    ),
  ),
)
        ),
         Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            style: TextStyle(color: Colors.white),
            controller: passwordController,
  decoration: InputDecoration(
    hintText: 'Password',
    
   hintStyle: TextStyle(color: Colors.white),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 3, color: Colors.white), //<-- SEE HERE
    ),
  ),
)
        ),
        ElevatedButton(onPressed: () {
       
        authService.signInWithEmailAndPassword(emailController.text, passwordController.text);

        }, child: Text('Log In')),
         ElevatedButton(onPressed: () {
  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
      
        }, child: Text('Sign Up'))
        ],
    ));
  }
}