import 'package:carpool_app/widgets/video_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CarpoolApp"),
        backgroundColor: Colors.red,
        actions: [
          Icon(Icons.search),
          Icon(Icons.camera),
          Icon(Icons.person)
          ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          VideoCard()
        ],),
      ),
    );
  }
}
