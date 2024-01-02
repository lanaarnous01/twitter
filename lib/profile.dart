import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_app/models/cat_model.dart';
import 'package:twitter_app/models/task_model.dart';
import 'package:twitter_app/post.dart';
import 'package:twitter_app/user_auth/firebase_auth_services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

   List <Todo> notes = [];

  final taskController = TextEditingController();

  var category = [
    'Posts', 'Replies', 'Highlights', 'Media', 'Likes'
  ];

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return  Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(onPressed: () {
    //  Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen()));
      
      showModalBottomSheet(context: context, builder: (BuildContext ctx) {
        return Column(
          children: [
            TextField(
            //give control to the parent widget over its child state
            controller: taskController,
            decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: 25, ),
              hintText: 'Whats Happening?'),
                style: TextStyle(fontSize: 30),
          ),
          IconButton(onPressed: () {
             notes.insert(0, Todo(task: taskController.text));
          setState(() {
            
          });
          Navigator.pop(context);
          }, icon: Icon(Icons.add))
          ],
        );
      },);
      
      
      },
      child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
              height: 180,
              color: Colors.blueAccent,
            ),
            Padding(
                padding: EdgeInsets.only(top: 140, left: 30),
              child: CircleAvatar(child: Icon(Icons.person, size: 50), radius: 40, backgroundColor: Colors.white,)),

               Padding(
                padding: EdgeInsets.only(top: 200, left: 300),
              child: Container(
          decoration:      BoxDecoration(
    border: Border.all(
      width: 2,
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.all(Radius.circular(20))
  ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Edit Profile', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),),
                ), )),

            ],
          ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Lana', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white
                        ),
              ),
            ),
            Icon(Icons.lock, color: Colors.white,),
            SizedBox(width: 220,),
            IconButton(onPressed: () async {
          await authService.signOut();
        }, icon: Icon(Icons.logout, color: Colors.white,)),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 8),
              child: Text('@test', style: TextStyle(
                fontSize: 18,
                color: Colors.white60),),
            ),
          ],
        ),
         Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(Icons.calendar_month_outlined,  color: Colors.white60 ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text('Joined December 2022', style: TextStyle(
                fontSize: 18,
                color: Colors.white60),),
            ),
          ],
        ),

         Row(
          children: [
              Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text('0 Following', style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.white),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text('0 Followers', style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.white),),
            ),
          ],
        ),
        // IconButton(onPressed: () async {
        //   await authService.signOut();
        // }, icon: Icon(Icons.abc, color: Colors.white,)),


         SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: category.length,
                itemBuilder: (context, index) => 
                Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(category[index], style: TextStyle(
                       color: Colors.white,
                       fontWeight: FontWeight.bold,
                       fontSize: 19
                       ),),
                    ),
                   
                  ],
                ),
              ),
            ),

          Flexible(
            fit: FlexFit.loose,
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: ((context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(backgroundColor: Colors.white,),
                  Column(
                    
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 90),
                        child: Row(
                          children: [
                           
                            Text('Lana', style: TextStyle(
                              color: Colors.white
                            ),),
                            Icon(Icons.lock, color: Colors.white,),
                              Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Text('@test', style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white60),),
                                  ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 180),
                        child: Text( notes[index].task,
                                       style: TextStyle(fontSize: 15, color: Colors.white),
                                       ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 30),
                        child: Row(
                          children: [
                            Icon(Icons.comment_rounded, color: Colors.white,),
                            SizedBox(width: 25,),
                               Icon(Icons.subdirectory_arrow_left, color: Colors.white,),
                                SizedBox(width: 25,),  
                                  Icon(Icons.favorite, color: Colors.white,),
                                    SizedBox(width: 25,), 
                                     Icon(Icons.analytics_outlined, color: Colors.white,),
                                   SizedBox(width: 25,),     
                                        Icon(Icons.download, color: Colors.white,)
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              );
              // ListTile(
              //   leading: Icon(Icons.person, color: Colors.white, size: 20,),
              //    title: Text(notes[index].task,
              //    style: TextStyle(fontSize: 15, color: Colors.white),
              //    ),
              //    subtitle: Row(children: [
              //     Icon(Icons.abc, color: Colors.white,), Icon(Icons.comment, color: Colors.white,)
              //    ],),
              //   trailing: Icon(Icons.punch_clock, color: Colors.white,)
              // );
            }) ),
            ),


        ],
      ),
    );
  }
}