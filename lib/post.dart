import 'package:flutter/material.dart';
import 'package:twitter_app/models/task_model.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  List <Todo> notes = [];

  final taskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          margin: EdgeInsets.all(25),
          child: TextField(
            //give control to the parent widget over its child state
            controller: taskController,
            decoration: InputDecoration(
              hintStyle: TextStyle(fontSize: 25, ),
              hintText: 'Task'),
                style: TextStyle(fontSize: 30),
          ),
        ),
        IconButton(onPressed: (){
          
       //   notes.insert(0, Todo(task: 'text'));
         notes.insert(0, Todo(task: taskController.text));
          setState(() {
            
          });
        }, icon: Icon(Icons.add)),

        Expanded(
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: ((context, index) {
              return ListTile(
                 title: Text(notes[index].task,
                 style: TextStyle(fontSize: 30),
                 ),
                trailing: Icon(Icons.punch_clock)
              );
            }) ),
        )
      ]),
    );
  }
}