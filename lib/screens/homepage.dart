import 'package:Database/model/student.dart';
import 'package:Database/screens/addstudent.dart';
import 'package:Database/screens/editStudent.dart';
import 'package:Database/services/studentOperation.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Student> students = [];

  void getStudentData() async {
    List<Student> s = await StudentOperation.instance.getAllStudents();

    setState(() {
      students = s;
    });
  }

  @override
  void initState() {
    getStudentData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student List')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => AddStudent()),
          );
          getStudentData();
        },
      ),
      body: students.length == 0
          ? Center(
              child: Text('No student'),
            )
          : ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                Student stud = students[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(stud.name[0]),
                  ),
                  title: Text(stud.name),
                  subtitle: Text(stud.branch),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () async {
                      await StudentOperation.instance.deleteStudent(stud);
                      getStudentData();
                    },
                  ),
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => EditStudent(
                          student: stud,
                        ),
                      ),
                    );
                    getStudentData();
                  },
                );
              },
            ),
    );
  }
}
