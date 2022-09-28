import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tasks/config.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  box = await Hive.openBox('easyTheme');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
      log('${currentTheme.currentTheme()}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentTheme(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swich theme'),
        actions: [
          IconButton(
            icon: ThemeMode == ThemeMode.dark
                ? const Icon(Icons.dark_mode_outlined)
                : const Icon(Icons.brightness_high),
            tooltip: 'Swich theme',
            onPressed: () {
              currentTheme.swichTheme();
            },
          ),
        ],
      ),
    );
  }
}
