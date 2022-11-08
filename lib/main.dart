import 'package:app_searchgifs/model/repository/gif_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'UI/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GifReposotiry(),
        ),
      ],
      child: const MyApp(key: null),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        hintColor: Colors.white38,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
