import 'package:flutter1/admin_pages/schedulePageAdmin.dart';
import 'package:flutter1/admin_pages/timetablePageAdmin.dart';
import 'package:flutter1/pages/homePage.dart';
import 'package:flutter1/pages/membersPage.dart';
import 'package:flutter1/pages/profilePage.dart';
import 'package:flutter/material.dart';
import 'announcementsPageAdmin.dart';
import 'groupsPageAdmin.dart';

class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({Key? key}) : super(key: key);

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            color: Colors.transparent,
            elevation: 0,
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: _gotoAnnouncementsPage,
              child: SizedBox(
              width: 300,
              height: 100,
              child: Column(
                children: const [
                  Icon(
                    Icons.announcement,
                    size: 80,
                  ),
                  Text('Announcements')
                ],
              ),
            ),
            )
          ),
          Card(
            color: Colors.transparent,
              elevation: 0,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: gotoSchedulePage,
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Column(
                    children: const [
                      Icon(
                        Icons.schedule,
                        size: 80,
                      ),
                      Text('Schedule')
                    ],
                  ),
                ),
              )
          ),
          Card(
            color: Colors.transparent,
              elevation: 0,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: (){
                  Navigator.pop(context);
                },
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Column(
                    children: const [
                      Icon(
                        Icons.menu_book_sharp,
                        size: 80,
                      ),
                      Text('Learning Materials')
                    ],
                  ),
                ),
              )
          ),
          Card(
              color: Colors.transparent,
              elevation: 0,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: _gotoAnnouncementsPage,
                child: SizedBox(
                  width: 300,
                  height: 100,
                  child: Column(
                    children: const [
                      Icon(
                        Icons.file_copy,
                        size: 80,
                      ),
                      Text('Assignments')
                    ],
                  ),
                ),
              )
          ),
        ],
      )

    ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                  image: AssetImage('images/wall.jpg'),
                  fit: BoxFit.cover
                ),
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              leading: const Icon(
                Icons.home,
                color: Colors.black,
                semanticLabel: 'Home',
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Profile'),
              leading: const Icon(
                Icons.person,
                color: Colors.black,
                semanticLabel: 'Profile',
              ),
              onTap: _gotoProfile,
            ),
            ListTile(
              leading: const Icon(
                Icons.group,
                color: Colors.black,
                semanticLabel: 'Members',
              ),
              title: const Text('Class members'),
              onTap: _gotoMember,
            ),
            ListTile(
              title: const Text('Groups'),
              leading: const Icon(
                Icons.groups,
                color: Colors.black,
                semanticLabel: 'Groups',
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context){
                          return const AdminGroupsPage(title: 'Groups',);
                        }
                    )
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.view_timeline ,
                color: Colors.black,
                semanticLabel: 'Time Table',
              ),
              title: const Text('Time Table'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context){
                          return const AdminTimeTablePage();
                        }
                    )
                );
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Settings'),
              leading: const Icon(
                Icons.settings,
                color: Colors.black,
                semanticLabel: 'Settings',
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('About us'),
              leading: const Icon(
                Icons.info,
                color: Colors.black,
                semanticLabel: 'About',
              ),
              onTap: () {
                  Navigator.pop(context);
                },
            ),
            Center(
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context){
                          return const HomePage();
                        })
                    );
                  },
                  child: const Text('User Login'),
                )
            )
          ],
        ),
      ),
    );
  }

  void _gotoMember(){
    Navigator.pop(context);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context){
        return const Members();
      })
    );
  }

  void _gotoProfile(){
    Navigator.pop(context);
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context){
            return const ProfilePage();
          }
      )
    );
  }

  void _gotoAnnouncementsPage(){
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context){
        return const AdminAnnouncementsPage();
      })
    );
  }

  void gotoSchedulePage(){
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context){
            return const AdminSchedulePage();
      })
    );
  }
}
