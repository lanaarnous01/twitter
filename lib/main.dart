import 'package:flutter/material.dart';
import 'package:twitter_app/authwrapper.dart';
import 'package:twitter_app/login.dart';
import 'package:twitter_app/profile.dart';
import 'package:twitter_app/signup.dart';
import 'package:twitter_app/starter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:twitter_app/user_auth/firebase_auth_services.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
// void main() async{
//   runApp(const MainApp());
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); 
  runApp(const MainApp());
  }
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create:(_) => AuthService() )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => Wrapper(),
            '/login': (context) => LoginScreen(),
            '/register': (context) => SignUpScreen(),
          },
          // home: StreamBuilder(
          //      stream: FirebaseAuth.instance.userChanges(),
          //      builder: (ctx, userSnapSh0ot) {
          //        if (FirebaseAuth.instance.currentUser != null) {
          //          FocusScope.of(context).requestFocus(FocusNode());
    
          //          return ProfileScreen();
          //        }
          //        return StarterScreen();
          //      }),
          
          //StarterScreen()
        
      ),
    );
        
  }
}
