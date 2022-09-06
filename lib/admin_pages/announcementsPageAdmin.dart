import 'package:flutter1/classes/announcement.dart';
import 'package:flutter/material.dart';

class AdminAnnouncementsPage extends StatefulWidget {
  const AdminAnnouncementsPage({Key? key}) : super(key: key);

  @override
  State<AdminAnnouncementsPage> createState() => _AdminAnnouncementsPageState();
}

class _AdminAnnouncementsPageState extends State<AdminAnnouncementsPage> {
  var announcements = <Announcement>[Announcement('Class is cancelled','The Literature class for today has been cancelled','10:54 am'),Announcement('title', 'Body', '12:10 pm'),Announcement('Hello', 'This is a dummy announcement', '1:23 pm')];// = [a1,a2,a3];
  final _biggerFont = const TextStyle(fontSize: 18);
  String title='';
  String body='';

  void add(){
    setState(() {
      announcements.add(Announcement(title, body, (DateTime.now()).toString()));
    });Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Announcements'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){Navigator.pop(context);},
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
          itemCount: announcements.length,
          itemBuilder: (context, i){
          return Center(
            child: Card(
              child: SizedBox(
                width: 300,
                height: 100,
                child: ListTile(
                  title: Text(
                    announcements[i].title,
                    style: _biggerFont,
                  ),
                  subtitle: Text(
                    announcements[i].body,
                  ),
                  trailing: Text(announcements[i].time),
                )
              ),
            ),
          );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addAnnouncement,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void addAnnouncement(){
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
