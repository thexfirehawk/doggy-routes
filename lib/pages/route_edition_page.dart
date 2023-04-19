import 'package:flutter/material.dart';
import 'package:my_app/services/firebase_service.dart';

class RouteEditionPage extends StatefulWidget {
  const RouteEditionPage({super.key});

  @override
  State<RouteEditionPage> createState() => _RouteEditionPageState();
}

class _RouteEditionPageState extends State<RouteEditionPage> {

  TextEditingController routeNameUpdateController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {

    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update existing route'),
      ),
      body: Column(
        children: [
          TextField(
            controller: routeNameUpdateController,
            decoration: const InputDecoration(
              hintText: 'Nuevo nombre de la ruta'
            ),
          ),
          ElevatedButton(onPressed: () async {
            await updateRoute(arguments['uid'], routeNameUpdateController.text).then((_) {
                  Navigator.pop(context);
            });
          }, child: const Text('Actualizar'))
        ]
      ),
    );
  }
}