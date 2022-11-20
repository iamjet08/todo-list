import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: App(),
  ));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  Home createState() => Home();
}

class Home extends State<App> {
  List task = [];
  String input = "";

  @override
  void initState() {
    super.initState();
    task.add("WRITE CODE");
    task.add("UPLOAD TO GITHUB");
    task.add("SLEEP");
    task.add("WAKE UP AT 6AM");
    task.add("GO TO SCHOOL");
    task.add("PA CHECK NI SIR");
    task.add("GET LOW GRADES");
    task.add("IYAQ");
    task.add("MAG CASHIER SA MCDO");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Add activity"),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          task.add(input);
                        });
                      },
                      child: const Text("Add"),
                    )
                  ],
                );
              });
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: task.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              key: ObjectKey(task[index]),
              onDismissed: (DismissDirection direction) {
                setState(() {
                  task.removeAt(index);
                });
              },
              child: Card(
                margin: const EdgeInsets.all(5),
                child: ListTile(
                  title: Text(task[index]),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red[400],
                    ),
                    onPressed: () {
                      setState(() {
                        task.removeAt(index);
                      });
                    },
                  ),
                ),
              ));
        },
      ),
    );
  }
}
