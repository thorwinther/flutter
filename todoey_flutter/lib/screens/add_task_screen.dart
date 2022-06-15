// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  var textController = TextEditingController();
  var title = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 45.0, right: 45.0, top: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 24,
                ),
              ),
              TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: '',
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 3.0),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 3.0),
                  ),
                ),
                controller: textController,
                onChanged: (newText) {
                  title = newText;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, title);
                  textController.clear();
                },
                child: Text('Add'),
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.lightBlueAccent,
                  //textStyle: const TextStyle(fontSize: 24, fontStyle: FontStyle.italic)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
