
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_list/models/model.dart';

class Studentprovider extends ChangeNotifier{


// to add a student

  final namecontroller=TextEditingController();

  final agecontroller = TextEditingController();

  final phonevontroller = TextEditingController();

  final placecontroller = TextEditingController();

      final formkey = GlobalKey<FormState>();


// edit a student

TextEditingController editname=TextEditingController();
TextEditingController editage=TextEditingController();
TextEditingController editphone=TextEditingController();
TextEditingController editplace=TextEditingController();

      final editformkey = GlobalKey<FormState>();


  File? fileimage;
  Future<void> getphoto() async {
    final photo = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (photo == null) {
      return;
    } else {
      final phototemp = File(photo.path);
      
        fileimage = phototemp;
   
    }
    notifyListeners();
  }



List<studentmodel>  studentlist=[];




Future<void> addstudent( value)async{
// studentListNotifier.value.add(value);
final studentDB= await Hive.openBox<studentmodel>('student_db');


await  studentDB.add(value);
studentlist.add(value); 
getAlldtudents();
notifyListeners();
}

  List<studentmodel> foundeduser = [];

Future<void>getAlldtudents()async{
final studentDB= await Hive.openBox<studentmodel>('student_db');
// studentListNotifier.value.clear();
//  studentListNotifier.value.addAll(studentDB.values);
studentlist.clear();
studentlist.addAll(studentDB.values);
 foundeduser=studentlist;
 notifyListeners();

 
 }

 Future<void>deletestudent( int index)async{
  final studentDB= await Hive.openBox<studentmodel>('student_db');
   await studentDB.deleteAt(index);
   getAlldtudents();
   notifyListeners();
 }
 
 Future<void>editstudent(int index,studentmodel value)async{
  final studentDB= await Hive.openBox<studentmodel>('student_db');
    studentDB.putAt(index,value);
   getAlldtudents();
   notifyListeners();
 }



 //search
  Future<void> searchResu(String text) async {
    List<studentmodel> result = [];
    if (text.isEmpty) {
      result = studentlist;
    } else {
      result = studentlist
          .where((element) =>
              element.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
    }
    foundeduser = result;
    notifyListeners();
  }
}

