import 'dart:ffi';

import 'package:demo/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widget/todo_item.dart';
import '../model/todo.dart';


// class HomePage extends StatelessWidget{
//   const HomePage({Key? key}) : super(key: key);

// @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: appBar(),
//       floatingActionButton: FloatingActionButton(
        
//         backgroundColor: Colors.red,
//         onPressed: (){},
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

// AppBar appBar() {
//   return AppBar(
//       title: const Text(
//         'To Do List App',
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: 18,
//           fontWeight: FontWeight.bold,

//         ),
//       ),
    
//       backgroundColor: Colors.white,
//       elevation: 0.0,
//       centerTitle: true,
//       leading: Container(
//         margin: const EdgeInsets.all(10),
//         alignment: Alignment.center,
        
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10)
//         ),
//         //  child: const Icon(
//         //   Icons.arrow_back,
//         //   color: Colors.black,
          
//         // ),
//       child: SvgPicture.asset('assets/icons/user-regular.svg',
//         height: 20,
//         width: 20,
//         ),
//       ),
//       actions: [
//         Container(
//         margin: const EdgeInsets.all(8.0),
//         alignment: Alignment.center,
        
//         decoration: BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.circular(100)
//         ),
//         //  child: const Icon(
//         //   Icons.add,
//         //   color: Colors.black,
//         //   size: 50,
//         // ),
//       child: SvgPicture.asset('assets/icons/user-regular.svg',
//         height: 20,
//         width: 20,
//         ),
//       ),
//       ],
      
//     );
// }
// }


// // class ToDoList extends StatefulWidget{
// //   _ToDoListState createState() => _ToDoListState();
// // }


// // class TodoList extends StatefulWidget {
// //   @override
// //   _ToDoListState createState() => _ToDoListState();
// // }

// // class _ToDoListState extends State <ToDoList>{
// //   final List<String> _todoList = <String>[];
  
// //   final TextEditingController _textEditingController = TextEditingController();
// //   @override
// //   Widget build(BuildContext context) {
// //     // TODO: implement build
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('To-do List'),
// //       ),

// //     );
// //   }

// //   void addToDoList(String title){
// //     setState((){
// //       _todoList.add(title);
// //     });
// //   }
// // }


class HomePage extends StatefulWidget{
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todosList = ToDo.todoList();
  final _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, 
            vertical:15),
            child: Column(
              children: [
               searchBox(),
               Expanded(
                 child:  ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 30, bottom: 20),
                      child: const Text('All ToDos',style: TextStyle(fontSize: 28,
                      fontWeight: FontWeight.bold, 
                      ),
                      ),
                    ),
                    for(ToDo todoo in todosList )
                    ToDoItem(todo: todoo,
                    onToDoChanged: _handleToDoChange,
                    onDeleteItem: _handleDeleteChange, 
                      ),
                      //2nd todo is value which we are getting from for(ToDo ***todo*** in todosList ), todosList bata aaune and 1st wala todo is todo_item.dart ko widget is expecting

                  ],
                 ),
               )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(child:
               Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                  left: 20,
                  right: 5,
                  top: 20,
                ),
                padding: const EdgeInsets.symmetric(horizontal:20, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                 boxShadow: const [BoxShadow(),
                 ],
                 borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _todoController,
                  decoration: const InputDecoration(
                    hintText: 'Add a new todo item',
                    border: InputBorder.none),
                ),
              ),
              ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: ElevatedButton(
                onPressed: (){
                  _addToDoItem(_todoController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: tdBlue,
                  elevation: 10,
                ),
                child: const Text('+', style: TextStyle(fontSize: 40,
                ),
                ),
                ),
            ),
            ],),
          ), 
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo){
    setState(() {
          todo.isDone = !(todo.isDone??false);
    });
  }

  void _handleDeleteChange(String id){
    setState(() {
      todosList.removeWhere((item) => item.id ==id);
    });
  }

  void _addToDoItem(String toDo){
    setState(() {
      todosList.add(ToDo(id:DateTime.now().millisecondsSinceEpoch.toString(), todoText: toDo)
     );
    });
   _todoController.clear();
  }

  Widget searchBox(){
    return  Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),               
              ),
              child: const TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: tdBlack,
                    size: 20,
                  ),
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 20,
                    maxWidth: 25,
                    ),
                    border: InputBorder.none,
                    hintText: 'Search',
                    hintStyle: TextStyle(color: tdBlack),
                ),
              ),
            );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [ const
        Icon(Icons.menu,
        color: tdBlack,
        size: 30,),
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset('assets/images/man.jpg'),
          ),
        ),
      ]),
    );
  }
}