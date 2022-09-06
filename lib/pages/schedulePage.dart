import 'package:flutter/material.dart';

import '../classes/schedule.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  var schedules = [Schedule('CodeFest','This coming Saturday'), Schedule('Quiz', 'Very interesting')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule'),
        /*actions: [
          IconButton(
              onPressed: addSchedule,
              icon: const Icon(Icons.add),
              tooltip: 'Add',
          )
        ],*/
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
    );
  }
}
