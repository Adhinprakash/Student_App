import 'package:hive_flutter/hive_flutter.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class studentmodel{

@HiveField(0)
 int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String age;

  @HiveField(3)
  final String phonenumber;

  @HiveField(4)
  final String place;

  @HiveField(5)
  final String photo;
 

  studentmodel( 
    {required this.name, 
    required this.age, 
   required  this.phonenumber,
     required this.place,
     required this.photo,
     this.id,
    }
      );
       
 
}