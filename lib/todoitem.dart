import 'package:flutter/material.dart';
import 'package:todo_uygulamasi/constant/tasktype.dart';
import 'package:todo_uygulamasi/model/task.dart';

class TodoItem extends StatefulWidget {
  final Task task;

  TodoItem({super.key, required this.task});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.task.type == Tasktype.note
                ? Image.asset("lib/assets/Category.png")
                : widget.task.type == Tasktype.contest
                    ? Image.asset("lib/assets/Category (2).png")
                    : Image.asset("lib/assets/Category (1).png"),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 21),
                  ),
                  Text(widget.task.description),
                ],
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (val) => {
                setState(
                  () {
                    widget.task.isCompleted = !widget.task.isCompleted;
                    isChecked = val!;
                  },
                ),
              },
            )
          ],
        ),
      ),
    );
  }
}
