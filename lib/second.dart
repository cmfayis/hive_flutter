import 'package:flutter/material.dart';
import 'package:flutter_mainsecond_app/person.dart';
import 'package:hive_flutter/hive_flutter.dart';

ValueNotifier<List<Studentmodel>> studentlist = ValueNotifier([]);
void addStudent(value) async {
  final student_db = await Hive.openBox<Studentmodel>('student_db');
   student_db.add(value);
  studentlist.value.add(value);
  studentlist.notifyListeners();
}

getAllStudent() async {
  final student_db = await Hive.openBox<Studentmodel>('student_db');
  studentlist.value.clear();
  studentlist.value.addAll(student_db.values);
  studentlist.notifyListeners();
}
deleteStudent(int index)async{
   final student_db = await Hive.openBox<Studentmodel>('student_db');
   student_db.deleteAt(index);
   getAllStudent();
}
void updateStudent(int index, Studentmodel updatedValue) async {
  final student_db = await Hive.openBox<Studentmodel>('student_db');
  student_db.putAt(index, updatedValue); 
  getAllStudent(); 
}
