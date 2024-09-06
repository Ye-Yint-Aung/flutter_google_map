import 'package:flutter/material.dart';
import 'package:flutter_google_map/presentation/map_page.dart';
import 'package:flutter_google_map/services/location_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await LocationService().handleLocationPermission();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MapPage(),
    );
  }
}

