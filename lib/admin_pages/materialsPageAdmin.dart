import 'package:flutter/material.dart';

class AdminMaterialsPage extends StatefulWidget {
  const AdminMaterialsPage({Key? key}) : super(key: key);

  @override
  State<AdminMaterialsPage> createState() => _AdminMaterialsPageState();
}

class _AdminMaterialsPageState extends State<AdminMaterialsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Materials'),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
          ),
          itemBuilder: (BuildContext context, int index){
            return Card(
              //color: Colors.amber,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(
                      Icons.file_copy_sharp,
                      size: 40,
                      color: Colors.black,
                    ),
                    Text('CSM 233')
                  ],
                )
              ),
            );
          },
      ),
    );
  }
}
