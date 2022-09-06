import 'package:flutter1/classes/member.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var user = Member('Emmanuel Zigah','zigah@gmail.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
          children: [
            Stack(
              alignment: const Alignment(0.1, 0.1),
              children:  const [
                CircleAvatar(
                  backgroundImage: AssetImage('images/wall.jpg'),
                  radius: 100,
                ),
              ],
            ),
            const ListTile(
              title: Text('Name'),
              leading: Icon(
                Icons.person,
                color: Colors.grey,
                semanticLabel: 'Name',
              ),
              subtitle: Text('Zigah Emmanuel'),
            ),
            const Divider(),
            const ListTile(
              title: Text('Phone'),
              leading: Icon(
                Icons.person,
                color: Colors.grey,
                semanticLabel: 'Phone',
              ),
              subtitle: Text('+233 548 932 933'),
            ),
            const Divider(),
            ListTile(
              title: const Text('About'),
              leading: const Icon(
                Icons.info,
                color: Colors.grey,
                semanticLabel: 'About',
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                 Container(
                   padding: const EdgeInsets.only(bottom: 8,top: 8),
                   child: Text(
                     'Class',
                     style: TextStyle(
                       color: Colors.grey[500],
                     ),
                   ),
                 ),
                  const Text(
                    'Computer Science',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Level',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                  const Text(
                    '400',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(
                    color: Colors.transparent,
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Gender',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                  const Text(
                    'Male',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
      )
    );
  }
}
