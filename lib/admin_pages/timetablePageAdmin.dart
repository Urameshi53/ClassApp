import 'package:flutter/material.dart';

import '../classes/class.dart';
import '../classes/course.dart';
import '../classes/day.dart';

class AdminTimeTablePage extends StatefulWidget {
  const AdminTimeTablePage({Key? key}) : super(key: key);

  @override
  State<AdminTimeTablePage> createState() => _AdminTimeTablePageState();
}

class _AdminTimeTablePageState extends State<AdminTimeTablePage> {
  var timetable = [Day('Monday'),Day('Tuesday'),Day('Wednesday'),Day('Thursday'),Day('Friday')];
  var selected;
  String code='';
  String title='';
  String lecturer='';
  final key = GlobalKey<FormState>();

  String time2 = '10:30 am - 12:25 pm';
  var monclasses = [Class('8:00 am - 10:55 am',Course('255','Electronics','Zigah Emmanuel')),Class('1:00 pm - 3:00 pm',Course('266', 'Mobile App development', 'Derrick Niklaus'))];
  var tueclasses = [Class('time1',Course('234','Assembly Language','Akoto Bernard'))];

  void addItems(){
    DateTime date = DateTime.now();
    setState(() {
      selected.classes.add(Class(date.toString(),Course(code,title,lecturer)));
    });Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time table'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){Navigator.pop(context);},
        ),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index){
            return Card(
              child: InkWell(
                onTap: (){
                  selected = timetable[index];goto();
                },
                child: SizedBox(
                  width: 100,
                  height: 50,
                  child: Center(
                      child: Text(timetable[index].name)
                  ),
                ),
              ),
            );
            /*return ListTile(
              title: Text(timetable[index].name),
              onTap: (){},
            );*/
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.transparent,),
          itemCount: 5
      ),
    );
  }

  void goto(){
    //List<Class> classes;
    if(selected.name == 'Monday'){
      selected.classes = monclasses;
    }else{
      selected.classes = tueclasses;
    }

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context){
        return Scaffold(
          appBar: AppBar(
            title: Text(selected.name),
            actions: [
              IconButton(
                onPressed: addClass,
                icon: const Icon(Icons.add),
                tooltip: 'Add class',
              )
            ],
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                  child: ListView.separated(
                      itemCount: selected.classes.length,
                      itemBuilder: (BuildContext context, int index){
                        /*return Column(
                          children: [
                            Text(selected.classes[index].time),
                            Text(selected.classes[index].course.code),
                            Text(selected.classes[index].course.name),
                            Text(selected.classes[index].course.lecturer)
                          ],
                        );*/
                        return Container(
                          height: 50,
                          margin: const EdgeInsets.all(2),
                          child: Center(
                            child: ListTile(
                              leading: const Icon(Icons.groups),
                              title: Text(selected.classes[index].course.name,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.transparent,),
                  ),
              )
            ],
          )

        );
      })
    );
  }

  void addClass(){
    Navigator.pop(context);
    Navigator.of(context).push(
      MaterialPageRoute( builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Add a class'),
              actions: [
                IconButton(
                    onPressed: addItems,
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
                            const Text('Course'),
                            ...[
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: '255',
                                  labelText: 'Code',
                                ),
                                onChanged: (value){
                                  code = value;
                                },
                              ),
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
                                  lecturer = value;
                                },
                              )
                            ],
                            ...[
                              TextFormField(
                                decoration: const InputDecoration(
                                  hintText: '8:00 am',
                                  labelText: 'Time'
                                ),
                              )
                            ]
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
