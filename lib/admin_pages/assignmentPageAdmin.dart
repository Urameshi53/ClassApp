import 'package:flutter/material.dart';

class AdminAssignmentsPage extends StatefulWidget {
  const AdminAssignmentsPage({Key? key}) : super(key: key);

  @override
  State<AdminAssignmentsPage> createState() => _AdminAssignmentsPageState();
}

class _AdminAssignmentsPageState extends State<AdminAssignmentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignments'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemBuilder: (BuildContext context, int index){
          return Card(
            //color: Colors.amber,
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      Icons.file_copy_sharp,
                      size: 40,
                      color: Colors.black,
                    ),
                    Text('Lab 5 VB')
                  ],
                )
            ),
          );
        },
      ),
    );;
  }
}
