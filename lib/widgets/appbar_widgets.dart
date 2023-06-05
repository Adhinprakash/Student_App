import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Appbarwidgets extends StatelessWidget {
  const Appbarwidgets({super.key, required this.title,  required this.leading});
final String title;
final IconData leading;
  @override
  Widget build(BuildContext context) {
    return ListTile( 
      leading: IconButton(onPressed: (){}, icon: Icon(leading),color: Colors.black,),
      title: Text(title,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
    
    );
  }
}