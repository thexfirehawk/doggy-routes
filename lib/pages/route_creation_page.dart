import 'package:flutter/material.dart';
import 'package:my_app/services/firebase_service.dart';

class RouteCreationPage extends StatefulWidget {
  const RouteCreationPage({super.key});

  @override
  State<RouteCreationPage> createState() => _RouteCreationPageState();
}

class _RouteCreationPageState extends State<RouteCreationPage> {

  TextEditingController routeNameController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create new route'),
      ),
      body: Column(
        children: [
          TextField(
            controller: routeNameController,
            decoration: const InputDecoration(
              hintText: 'Nombre de la nueva ruta'
            ),
          ),
          ElevatedButton(onPressed: () async {
            await createRoute(routeNameController.text).then((_) {
                  Navigator.pop(context);
            });
          }, child: const Text('Guardar'))
        ]
      ),
    );
  }
}