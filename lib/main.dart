import 'package:flutter/material.dart';
//Services
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//Pages
import 'package:my_app/pages/home_page.dart';
import 'package:my_app/pages/route_creation_page.dart';
import 'package:my_app/pages/route_edition_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Routes App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/create': (context) => const RouteCreationPage(),
        '/edit': (context) => const RouteEditionPage(),
      },
    );
  }
}
