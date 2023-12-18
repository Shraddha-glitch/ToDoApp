import 'package:demo/pages/home.dart';
import 'package:flutter/material.dart';
// import '../model/todo.dart';
// import '../widget/todo_item.dart';

void main(){
   WidgetsFlutterBinding.ensureInitialized();
   runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

@override
  Widget build(BuildContext context){
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     theme: ThemeData(fontFamily: 'OpenSans'),
     home: HomePage(),
    );
  }
}