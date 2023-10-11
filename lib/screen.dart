import 'package:flutter/material.dart';
import 'package:flutter_mainsecond_app/person.dart';
import 'package:flutter_mainsecond_app/second.dart';
import 'package:hive_flutter/adapters.dart';

class pageone extends StatefulWidget {
  const pageone({super.key});

  @override
  State<pageone> createState() => _pageoneState();
}

class _pageoneState extends State<pageone> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final box = Hive.openBox('boxopen');

  @override
  Widget build(BuildContext context) {
    getAllStudent();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('TODO APP',style: TextStyle(color: Colors.black),),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 10, 33, 55),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextField(
                      controller: nameController, 
                      decoration:const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        hintText: 'Name',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: ageController, 
                      decoration:const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Age',
                        labelText: 'Age',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Buttonpress();
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ValueListenableBuilder(
                    valueListenable: studentlist,
                    builder: (BuildContext ctx, List<Studentmodel> studentlist1,
                        Widget? child) {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          final data = studentlist1[index];
                          return Card(
                            color: Color.fromARGB(255, 87, 249, 217),
                            child: ListTile(
                              title: Text("Name :${data.name}"),
                              subtitle: Text("Age  :${data.age}"),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      final _age=ageController;
                                      final _name=nameController;
                                      final _student=Studentmodel(name: _name.text, age:_age.text);
                                    //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>update(),),);
                                    updateStudent(index,_student );
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      deleteStudent(index);
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 5,);
                        },
                        itemCount: studentlist1.length,
                      );
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Buttonpress() {
    final name = nameController.text;
    final age = ageController.text;
    if(age.isNotEmpty&&name.isNotEmpty){
     final student = Studentmodel(name: name, age: age);
       addStudent(student);
       nameController.clear();
       ageController.clear();
    }
   
   
  }
}
