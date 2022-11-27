import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterdemo/firebase_options.dart';
import 'package:flutterdemo/views/add_book.dart';
import 'package:flutterdemo/views/book_list.dart';
import 'package:provider/provider.dart';

import 'controller/book_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(ChangeNotifierProvider(
    child: const MyApp(),
    create: (_) => BookProvider(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BookList(),
    );
  }
}
