import 'package:flutter/material.dart';

class ToDo{
  String? id;
  String? todoText;
  bool? isDone;
  ToDo({
    required this.id,
    required this.todoText,
    this.isDone=false,
  });

  static List<ToDo> todoList(){
    return[
      ToDo(id: '01', todoText: 'Morning Exercise', isDone: true),
      ToDo(id: '02', todoText: 'Breakfast', isDone: true),
      ToDo(id: '03', todoText: 'Washing Clothes', ),
      ToDo(id: '04', todoText: 'Ready for office', ),
      ToDo(id: '05', todoText: 'Make todo list app',),
      ToDo(id: '06', todoText: 'Meeting with client',),
      ToDo(id: '07', todoText: 'Buy Groceries',),
      ToDo(id: '08', todoText: 'Dinner Time'),
    ];
  }

}