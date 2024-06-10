import 'package:dummy/database_handler.dart';
import 'package:dummy/screens/detail.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  DBHelper? dbHelper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DBHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notes',
        ),
        centerTitle: true,

      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: (){
                    dbHelper!.db.then((value) {
                      dbHelper!.insert(
                          NotesModel(
                              title: "first note",
                              age: 45,
                              description: "This is first try",
                              email: "tarun22kumar2@gamil.com"
                          )
                      ).then((value)
                      {
                        print('data added');
                      }).onError((error, stackTrace)
                      {
                        print(error.toString());
                      });
                    });
                  },
                  child: Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}