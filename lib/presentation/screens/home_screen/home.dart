import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_list/controller/provider/student_provider.dart';
import 'package:student_list/presentation/screens/add_screen/add_student.dart';
import 'package:student_list/screens/list_students.dart';
import 'package:student_list/widgets/appbar_widgets.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<Studentprovider>(context, listen: false).getAlldtudents();
    return  Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                const Appbarwidgets(
                    title: 'Students List',
                    leading: Icons.home_filled,
                    ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: CupertinoSearchTextField(
                    itemColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                      onChanged: (value) =>
                          Provider.of<Studentprovider>(context, listen: false)
                              .searchResu(value),
                              
                      padding: const EdgeInsets.all(12),
                      ),
                ),
                const Liststudents()
              ],
            ),
          ],
        ),
      ),
    floatingActionButton: FloatingActionButton(
      
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>const Addstudent()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
  







// Scaffold(
//   body: SafeArea(child:  
//    SizedBox(
//     height: 200,
//      child: ListView(
//       children:  [
//         Column(
//           children: [
//            const  Appbarwidgets(title:"Student List",leading:Icons.home_filled, ),
//             Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
//             child:  CupertinoTextField(
//               onChanged: (value) => Provider.of<Studentprovider>(context,listen: false).searchResu(value),
//             ),
   
//             ),
//              const Liststudents(),
             
   
//           ],
//         )
//       ],
//      ),
//    )),


  // floatingActionButton: FloatingActionButton(
  //       backgroundColor: Colors.black,
  //       onPressed: () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => Addstudent()),
  //         );
  //       },
  //       child: const Icon(Icons.add),
  //     ),


    
//     )