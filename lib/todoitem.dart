import 'package:flutter/material.dart';
import 'package:todo_uygulamasi/constant/tasktype.dart';
import 'package:todo_uygulamasi/model/task.dart';
import 'package:todo_uygulamasi/model/todo.dart';

class TodoItem extends StatefulWidget {
  final Todo task;

  TodoItem({super.key, required this.task});

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.task.completed! == true ? Colors.grey : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /* TODO FİREBASE İSLEMLERİNDE DÜZELTİLECEK
            widget.task.type == Tasktype.note
                ? Image.asset("lib/assets/Category.png")
                : widget.task.type == Tasktype.contest
                    ? Image.asset("lib/assets/Category (2).png")
                    : Image.asset("lib/assets/Category (1).png"),
                    */
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.todo!,
                    style: TextStyle(
                        decoration: widget.task.completed!
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        fontSize: 21),
                  ),
                  Text(
                    "User: ${widget.task.userId}",
                    style: TextStyle(
                      decoration: widget.task.completed!
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (val) => {
                setState(
                  () {
                    widget.task.completed = !widget.task.completed!;
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
