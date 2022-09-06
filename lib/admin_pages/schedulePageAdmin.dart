import 'package:flutter/material.dart';

import '../classes/schedule.dart';

class AdminSchedulePage extends StatefulWidget {
  const AdminSchedulePage({Key? key}) : super(key: key);

  @override
  State<AdminSchedulePage> createState() => _AdminSchedulePageState();
}

class _AdminSchedulePageState extends State<AdminSchedulePage> {
  var schedules = [Schedule('CodeFest','This coming Saturday'), Schedule('Quiz', 'Very interesting')];
  String title='';
  String body='';

  void add(){
    setState(() {
      schedules.add(Schedule(title, body));
    });Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
        actions: [
          IconButton(
              onPressed: addSchedule,
              icon: const Icon(Icons.add),
              tooltip: 'Add',
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: schedules.length,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    height: 50,
                    margin: const EdgeInsets.all(2),
                    child: Center(
                      child: ListTile(
                        leading: const Icon(Icons.info),
                        title: Text(schedules[index].title,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  );
            }),

          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addSchedule,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void addSchedule(){
    Navigator.of(context).push(
        MaterialPageRoute( builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Add a class'),
              actions: [
                IconButton(
                  onPressed: add,
                  icon: const Icon(Icons.done),
                  tooltip: 'Save',
                )
              ],
            ),
            body: Form(
              child: Scrollbar(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Card(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                    hintText: 'Programming',
                                    labelText: 'Title'
                                ),
                                onChanged: (value){
                                  title = value;
                                },
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                    hintText: 'Lancelot Knight',
                                    labelText: 'Lecturer'
                                ),
                                onChanged: (value){
                                  body = value;
                                },
                              )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        )
    );
  }
}
