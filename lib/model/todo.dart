import 'package:flutter/animation.dart';

class Todo {
  Todo({
    required this.id,
    required this.todo,
    required this.userId,
    required this.completed,
  });

  int? id;
  String? todo;
  bool? completed;
  int? userId;

  //from json
  Todo.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    todo = json["todo"];
    userId = json["userID"];
    completed = json["completed"];
  }

//to json
  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = {};
    data["id"] = id;
    data["todo"] = todo;
    data["userID"] = userId;
    data["completed"] = completed;

    return data;
  }


}
