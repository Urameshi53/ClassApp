import 'package:flutter/material.dart';
import 'package:flutter1/admin_pages/homePageAdmin.dart';

class AdminSignin extends StatefulWidget {
  const AdminSignin({Key? key}) : super(key: key);

  @override
  State<AdminSignin> createState() => _AdminSigninState();
}

class _AdminSigninState extends State<AdminSignin> {
  final key = GlobalKey<FormState>();
  String username='Admin';
  String password='root';
  String mUsername='';
  String mPassword='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Sign in'),
      ),
      body: Form(
      key: key,
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username'
                  ),
                  onChanged: (value){
                    mUsername = value;
                  },
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please enter a valid username';
                    }
                    return null;
                  },
                ),
                TextField(
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password'
                  ),
                  onChanged: (value){
                    mPassword = value;
                  },
                ),
                ElevatedButton(
                    onPressed: (){
                        if(key.currentState!.validate()){
                          gotoAdmin();
                          if(mUsername == username && mPassword== password){
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Login Successful'))
                            );gotoAdmin();
                          }
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Admin Login Failed'))
                          );
                          const HomePageAdmin();
                        }
                      },
                    child: const Text('Submit'),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
  void gotoAdmin(){
    Navigator.pop(context);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context){
        return const HomePageAdmin();
      })
    );
  }
}
