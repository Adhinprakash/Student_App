// import 'dart:io';
// import 'dart:js';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_list/controller/provider/student_provider.dart';
import 'package:student_list/core/heights.dart';
import 'package:student_list/models/model.dart';
import 'package:student_list/presentation/screens/add_screen/widgets/text_formwidget.dart';
import 'package:student_list/widgets/snackbar_widget.dart';

class Addstudent extends StatelessWidget {
  const Addstudent({super.key});

  @override
  Widget build(BuildContext context) {
    final studentprovider =
        Provider.of<Studentprovider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title:const  Align(
          alignment: Alignment.center,
          child: Text('Add Student',style: TextStyle(color: Colors.black),)),
      ),
      body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Consumer<Studentprovider>(
            builder: (context, value, _) {
              return Form(
                key: value.formkey,
                child: Column(
                  children: [
                    value.fileimage == null
                        ? Material(
                          borderRadius: 
                          BorderRadius.circular(120),
                          elevation: 120 ,
                          child: const CircleAvatar(
                              radius: 80,
                              backgroundImage: AssetImage('assets/noprofile.jpg'),
                              backgroundColor: Colors.black,
                            ),
                        )
                        : CircleAvatar(   
                            radius: 70,
                            backgroundImage: FileImage(
                              File(value.fileimage!.path),
                            ),
                          ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.white,shadowColor: Colors.black,elevation: 20),
                          
                          onPressed: () {
                            studentprovider.getphoto();
                          },
                          icon: const Icon(Icons.image_outlined,color: Colors.black,),
                          label: const Text('Add an image',style: TextStyle(color: Colors.black),),
                          
                        )
                      ],
                    ),
                    kheight20,
                    TextformWidget(
                       
                      hintText: "Name",
                      labelText: "Username",
                      ctrl: value.namecontroller,
                      keyboardType: TextInputType.name,
                    ),
                    kheight20,
                    TextformWidget(
                        hintText: "Age",
                        labelText: "Age",
                        ctrl: value.agecontroller,
                        keyboardType: TextInputType.number),
                        kheight20,
                        
                    TextformWidget(
                        hintText: "phone number",
                        labelText: "Phone ",
                        ctrl: value.phonevontroller,
                        keyboardType: TextInputType.phone,
                        
                        
                        ),
                        kheight20,
                    TextformWidget(
                        hintText: "Enter place",
                        labelText: "Place",
                        ctrl: value.placecontroller,
                        keyboardType: TextInputType.name),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.white,shadowColor: Colors.black,elevation: 20  ),
                        onPressed: () {
                          onAddstudentbuttonclicked(
                              context,
                              value.namecontroller,
                              value.agecontroller,
                              value.phonevontroller,
                              value.placecontroller);
                          Navigator.of(context).pop();
                          value.namecontroller.clear();
                          value.agecontroller.clear();
                          value.phonevontroller.clear();
                          value.fileimage = null;
                        },
                        child: const Text('Add',style:TextStyle(color: Colors.black,),))
                  ],
                ),
              );
            },
          ))),
    );
  }
}

Future<void> onAddstudentbuttonclicked(
  context,
  TextEditingController namectrl,
  TextEditingController agectrl,
  TextEditingController phnctrl,
  TextEditingController placectrl,
) async {
  final name = namectrl.text.trim();
  final age = agectrl.text.trim();
  final phonenumber = phnctrl.text.trim();
  final place = placectrl.text.trim();

  if (name.isEmpty ||
      age.isEmpty ||
      phonenumber.isEmpty ||
      place.isEmpty ||
      Provider.of<Studentprovider>(context, listen: false)
          .fileimage!
          .path
          .isEmpty) {
    return;
  } else {
    snackBarwidget(ctx: context, title: "New student added", clr: Colors.red);
  }
  final student = studentmodel(
    name: name,
    age: age,
    phonenumber: phonenumber,
    place: place,
    photo: Provider.of<Studentprovider>(context, listen: false).fileimage!.path,
  );
  Provider.of<Studentprovider>(context, listen: false).addstudent(student);
  Provider.of<Studentprovider>(context, listen: false).getAlldtudents();
}

                                // 'https://imgs.search.brave.com/tzo0A3R4UohUphhu1vXYNx3h_ZRhljxoxkme33POotA/rs:fit:264:225:1/g:ce/aHR0cHM6Ly90c2Ux/LmV4cGxpY2l0LmJp/bmcubmV0L3RoP2lk/PU9JUC5HWnk1YzRD/Qk92TFhQTUVSRVQx/WU53QUFBQSZwaWQ9/QXBp')
