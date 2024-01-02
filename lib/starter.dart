import 'package:flutter/material.dart';
import 'package:twitter_app/signup.dart';

class StarterScreen extends StatefulWidget {
  const StarterScreen({super.key});

  @override
  State<StarterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<StarterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRs5CWs2T6mtzFxudcZHvgNEevFcm-JXPe4nw&usqp=CAU",
          height: 100,
          width: 100,
          ),
          Text("Happening now",
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
          ),

           Text("Join today.",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
          ),
         ElevatedButton(onPressed: () {}, 
         child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
            Icon(Icons.search, color: Colors.black,),
             Text('Sign in with google', style: TextStyle(fontWeight: FontWeight.bold,
             color: Colors.black

),),
           ],
         ),
         
         style:  ElevatedButton.styleFrom(backgroundColor: Colors.white,
         shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    )
         ),
),
          Divider(
        height: 40,
        thickness: 1,
        color: Color.fromARGB(255, 224, 223, 223),
        indent: 30,
        endIndent: 30,
        
      ),
      
       ElevatedButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));

       }, 
         child: Center(
           child: Text('Create an account', style: TextStyle(fontWeight: FontWeight.bold,
         
         ),),
         ),
         
         style:  ElevatedButton.styleFrom(backgroundColor: Colors.blue,
         shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
    )
         ),
),

        ],
      ),
    );
  }
}