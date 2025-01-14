import 'package:flutter/material.dart';
import 'package:practice2/data/Home2.dart';
import 'package:practice2/data/local/dbProvider.dart';
import 'package:practice2/data/local/db_connection.dart';
import 'package:practice2/provider/Home.dart';
import 'package:practice2/provider/list_details.dart';
import 'package:practice2/provider/list_map_provider.dart';
import 'package:practice2/provider/list_provider.dart';
import 'package:practice2/themeProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ListMapProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NumberListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DBProvider(dbConnection: DBConnection.getInstance,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            themeMode: themeProvider.getTheme() ? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData.dark(),
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey,),
            ),
            debugShowCheckedModeBanner: false,
            home: Home2(),
          );
        },
      ),
    );
  }
}