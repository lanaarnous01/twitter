import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_app/profile.dart';
import 'package:twitter_app/user_auth/firebase_auth_services.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

 // final FirebaseAuthServices _auth = FirebaseAuthServices();


  
 

  @override
  Widget build(BuildContext context) {
    TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextFormField(
            controller: _usernameController,
            style: TextStyle(color: Colors.white),
  decoration: InputDecoration(
    hintText: 'Username',
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
            controller: _emailController,
            style: TextStyle(color: Colors.white),
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
            controller: _passwordController,
  decoration: InputDecoration(
    hintText: 'Password',
   hintStyle: TextStyle(color: Colors.white),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 3, color: Colors.white), //<-- SEE HERE
    ),
  ),
)
        ),
        ElevatedButton(onPressed: () async {
         // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
        await authService.createUserWithEmailAndPassword(_emailController.text, _passwordController.text);
         Navigator.pop(context);
        }, child: Text('Sign Up'))
        ],
      ),
    );
  }


}





