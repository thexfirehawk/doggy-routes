import 'package:flutter/material.dart';
//Services
import 'package:my_app/services/firebase_service.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Routes App Bar'),
      ),
      body: FutureBuilder(
          future: getRoutes(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data?[index]["name"]),
                    trailing: PopupMenuButton(
                      itemBuilder: (context) {
                        return [
                          const PopupMenuItem(
                              value: 'edit',
                              child: Text('Edit'),
                          ),
                        ];
                      },
                      onSelected: (value) {
                        actionPopUpItemSelected(value, context, snapshot.data?[index]);
                      },
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/create');
          setState(() {}); //Reload widget
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


void actionPopUpItemSelected(value, context, indexData) {
  if (value == 'edit') {
    Navigator.pushNamed(context, '/edit', arguments: {
      "uid": indexData['uid']
    });
  } else if (value == 'delete') {
    //TODO
  }
}
