import 'package:flutter1/classes/member.dart';
import 'package:flutter/material.dart';

class Members extends StatefulWidget {
  const Members({Key? key}) : super(key: key);

  @override
  State<Members> createState() => MembersState();
}

class MembersState extends State<Members> {
  var members = [Member('Zigah Emmanuel', 'emmanuel@gmail.com'),Member('Benjamin Thanos', 'thanos@gmail.com'),Member('Kojo Asang', 'kojo@gmail.com'),Member('Flint Kofi', 'kofi@gmail.com'),Member('Sowah Solomon', 'sowah@gmail.com')];

  final _biggerFont = const TextStyle(fontSize: 18);

  var selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Class Members'),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: ListView.builder(
          itemCount: members.length,
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                members[index].name,
                style: _biggerFont,
              ),
              subtitle: Text(
                members[index].email
              ),
              leading: const Icon(
                Icons.person,
                color: Colors.black,
                semanticLabel: 'Avatar',
                size: 70,
              ),
              onTap: (){
                setState(() {
                  selected = members[index];
                });memberPage();
              },
            );
          },
        )
    );
  }

  void memberPage(){
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Member'),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                    alignment: const Alignment(0.1, 0.1),
                    children:  [
                      const CircleAvatar(
                        backgroundImage: AssetImage('images/wall.jpg'),
                        radius: 100,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.black45,
                        ),
                        child: const Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                    Text(selected.name),
                    Text(selected.email),
              ]
                ),
              )
            );
          }
      )
    );
  }
}
