import 'package:flutter/material.dart';
import 'package:flutter1/login_signup/user_login.dart';

class Genesis extends StatefulWidget {
  const Genesis({Key? key}) : super(key: key);

  @override
  State<Genesis> createState() => _GenesisState();
}

class _GenesisState extends State<Genesis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                      'Hello There!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40
                      )
                  ),
                  const SizedBox(height: 30,),
                  Text(
                    'Automatic identity verification which enable you to verify your identity',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height/3,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context){
                            return const UserLogin();
                          })
                      );
                    },
                    color: Colors.indigoAccent[400],
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(40)
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white70
                      ),),
                  ),
                  const Divider(color: Colors.transparent,),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){

                    },
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)
                    ),
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              )

            ],
          ),
        ),
      )
    );
  }
}
