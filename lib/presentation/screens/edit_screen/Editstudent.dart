import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_list/controller/provider/student_provider.dart';
import 'package:student_list/core/heights.dart';
import 'package:student_list/models/model.dart';

class Editstudent extends StatelessWidget {
  final String name;
  final String age;
  final String phone;
  final String place;
  final String photo;
  final int index;

  const Editstudent(
      {super.key,
      required this.name,
      required this.age,
      required this.phone,
      required this.place,
      required this.photo,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,elevation: 20,
        toolbarHeight: 70,
        title: Text('Edit',style: TextStyle(color: Colors.black),),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Consumer<Studentprovider>(
            builder: (context, value, chid) {
              value.editname = TextEditingController(text: name);
              value.editage = TextEditingController(text: age);
              value.editphone = TextEditingController(text: phone);
              value.editplace = TextEditingController(text: place);

              return Column(
                children: [
                  const Text(
                    'Edit student details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                      radius: 80,
                      backgroundImage: photo == null
                          ? FileImage(
                              File(photo),
                            )
                          : FileImage(File(value.fileimage?.path ?? photo))),
                  kheight,
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.black,
                        elevation: 20,
                        backgroundColor: Colors.white),
                    onPressed: () {
                      value.getphoto();
                    },
                    icon: const Icon(Icons.image_outlined),
                    label: const Text(
                      'Edit image',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: value.editformkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: value.editname,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(19),
                            ),
                            hintText: 'Enter your Name ',
                            labelText: 'Name',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required Name';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: value.editage,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(19),
                            ),
                            hintText: 'Enter your Age',
                            labelText: 'Age',
                          ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required Age';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          maxLength: 10,
                          controller: value.editphone,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(19),
                            ),
                            hintText: 'Enter your phonenumber',
                            labelText: 'Phonenumber',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required Number';
                            } else if (value.length < 10) {
                              return 'invalid number';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: value.editplace,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(19),
                            ),
                            hintText: 'Enter your Adderss',
                            labelText: 'Address',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required Adderss';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 40,
                          child: ElevatedButton.icon(

                            style: ElevatedButton.styleFrom(backgroundColor: Colors.white,shadowColor: Colors.black,elevation: 20),
                            onPressed: () {
                              if (value.editformkey.currentState!.validate()) {
                                onEditSaveButton(
                                  ctx: context,
                                  index: index,
                                  name: value.editname,
                                  age: value.editage,
                                  phone: value.editphone,
                                  place: value.editplace,
                                  photo: value.fileimage?.path ?? photo,
                                );

                                Navigator.of(context).pop();
                                FocusScope.of(context).unfocus();
                              }
                            },
                            icon: const Icon(Icons.check,color: Colors.black,),
                            label: const Text('save',style: TextStyle(color: Colors.black),),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      )),
    );
  }
}

Future<void> onEditSaveButton(
    {required ctx,
    required index,
    required photo,
    required TextEditingController name,
    required TextEditingController age,
    required TextEditingController phone,
    required TextEditingController place}) async {
  // ignore: non_constant_identifier_names
  final StudentModel = studentmodel(
      name: name.text,
      age: age.text,
      phonenumber: phone.text,
      place: place.text,
      photo: photo);
  ScaffoldMessenger.of(ctx).showSnackBar(
    const SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(30),
      backgroundColor: Colors.blueGrey,
      content: Text(
        'SAVED',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
  Provider.of<Studentprovider>(ctx, listen: false)
      .editstudent(index, StudentModel);
}
