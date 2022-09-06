import 'package:flutter1/classes/announcement.dart';
import 'package:flutter/material.dart';

class AnnouncementsPage extends StatefulWidget {
  const AnnouncementsPage({Key? key}) : super(key: key);

  @override
  State<AnnouncementsPage> createState() => _AnnouncementsPageState();
}

class _AnnouncementsPageState extends State<AnnouncementsPage> {
  var announcements = <Announcement>[
    Announcement('Class is cancelled',
        'The Literature class for today has been cancelled', '10:54 am'),
    Announcement('title', 'Body', '12:10 pm'),
    Announcement('Hello', 'This is a dummy announcement', '1:23 pm')
  ]; // = [a1,a2,a3];
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Announcements'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: announcements.length,
          itemBuilder: (context, i) {
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
    );
  }
}
