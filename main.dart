import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Retrieve text input',
      home: FoodForm(),
    );
  }
}
 
 class FoodForm extends StatefulWidget{
   @override
   _FoodFormState createState() => _FoodFormState();
 }

String food; 

 class _FoodFormState extends State<FoodForm>{
   final myController =TextEditingController();
   @override
   void dispose(){
     myController.dispose();
     super.dispose();
   }

   @override
   Widget build(BuildContext context){
     var scaffold = Scaffold(
       appBar: AppBar(
         title: Text('Retrieve text input'),
       ),
       body:Padding(
         padding: const EdgeInsets.all(16.0),
         child: TextField(
           controller:myController,
         ),
       ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          food = myController.text;
          return food;
        
        },
        tooltip: 'Show me the money!',
        child:Icon(Icons.text_fields)
      ), 
     );
     return scaffold;
   }
 }

