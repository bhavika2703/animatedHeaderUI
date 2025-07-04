import 'package:flutter/material.dart';
import 'package:prectice0702/ui/home_view.dart';
import 'package:prectice0702/viewmodels/home_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ChangeNotifierProvider(
        create: (context) => HomeModel(),
        child: MyHomePage(),
      ),
    );
  }
}
