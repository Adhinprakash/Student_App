


// class SearchWidget extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return  ListView.builder(
//           itemBuilder: (ctx, index) {
//             final data = studentList[index];
//             if (data.name.trim().contains(
//                   query.trim(),
//                 )) {
//               return Column(
//                 children: [
//                   ListTile(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: ((context) {
//                             return const Liststudents() ;
//                           }),
//                         ),
//                       );
//                     },
//                     title: Text(data.name),
//                     leading: CircleAvatar(
//                       backgroundImage: FileImage(File(data.photo)),
//                     ),
//                   ),
//                   const Divider()
//                 ],
//               );
//             } else {
//               return Container();
//             }
//           },
//           itemCount: studentList.length,
//         );
//       }
    
//   }

  

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: studentListNotifier,
//       builder: ((BuildContext context, List<studentmodel> studentList,
//           Widget? child) {
//         return ListView.builder(
//           itemBuilder: (ctx, index) {
//             final Data = studentList[index];
//             if (Data.name.toLowerCase().contains(
//                   query.trim() ,
//                 )) {
//               return Column(
//                 children: [
//                   ListTile(
//                     onTap: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: ((context) {
//                             return StudentDetails(name: Data.name, age: Data.age, phonenumber:Data. phonenumber, place: Data.place, photo: Data.photo);
//                           }),
//                         ),
//                       );
//                     },
//                     title: Text(Data.name),
//                     leading: CircleAvatar(
//                       backgroundImage: FileImage(File(Data.photo)),
//                     ),
//                   ),
//                   const Divider()
//                 ],
//               );
//             } else {
//               return Container();
//             }
//           },
//           itemCount: studentList.length,
//         );
//       }),
//     );
//   }
