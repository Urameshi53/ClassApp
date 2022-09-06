import 'package:flutter1/classes/group.dart';
import 'package:flutter/material.dart';


class GroupsPage extends StatefulWidget {
  const GroupsPage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  var groups = [Group('Mabel',10),Group('Hannah',5)];
  var selected;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: groups.length,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    height: 50,
                    margin: const EdgeInsets.all(2),
                    child: Center(
                      child: ListTile(
                        leading: const Icon(Icons.groups),
                        title: Text(groups[index].name,
                          style: const TextStyle(fontSize: 18),
                        ),
                        onTap: (){
                          setState(() {
                            selected = groups[index];
                          });groupPage();
                        },//groupPage(),
                      ),
                    ),
                  );
                }
            ),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void groupPage(){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context){
          return Scaffold(
            appBar: AppBar(
              title: Text(selected.name),
            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemCount: selected.members.length,
                      itemBuilder: (BuildContext context, int index){
                        return Container(
                          height: 50,
                          margin: const EdgeInsets.all(2),
                          child: Center(
                            child: ListTile(
                              leading: const Icon(
                                  Icons.person,
                                size: 30,
                              ),
                              title: Text('Person ${selected.members[index]}'),
                            ),
                          ),
                        );
                      }, separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.transparent,),
                  ),
                )
              ],
            ),
          );
        }
      )
    );
  }
}



