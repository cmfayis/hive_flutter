import 'package:hive_flutter/hive_flutter.dart';
part 'person.g.dart';
@HiveType(typeId: 1)
class Studentmodel{
  
   @HiveField(0)
  late final String name;
  @HiveField(1)
  late final String age;

  Studentmodel({required this.name, required this.age,});
  
}