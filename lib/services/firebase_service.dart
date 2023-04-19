import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore dataBase = FirebaseFirestore.instance;

//Create
Future<void> createRoute(String name) async {
  await dataBase.collection('routes').add({"name": name});
}

//Read
Future<List> getRoutes() async {
  List routesList = [];
  CollectionReference collectionReferenceRoutes = dataBase.collection('routes');

  //TODO: Limit number of query results
  QuerySnapshot queryRoutes = await collectionReferenceRoutes.get();
  
  for (var doc in queryRoutes.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final routeObj = {
      "uid": doc.id,
      "name": data["name"],
    };

    routesList.add(routeObj);
  }

  /* Intentionally delayed */
  await Future.delayed(const Duration(seconds: 3));
  
  return routesList;
}

//Update
Future<void> updateRoute(String uid, String newName) async {
  await dataBase.collection('routes').doc(uid).set({"name": newName});
}