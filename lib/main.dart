  import 'package:flutter/material.dart';
import 'package:flutter_mainsecond_app/person.dart';
import 'package:flutter_mainsecond_app/screen.dart';

import 'package:hive_flutter/hive_flutter.dart';

void main()async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(StudentmodelAdapter());
  
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: pageone(),
      debugShowCheckedModeBanner: false,
    );
  }
}