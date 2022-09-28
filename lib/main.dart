import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasks/pages/home_page.dart';
import 'package:tasks/provider/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
          builder: (context, ThemeProvider themeProvider, child) {
        return MaterialApp(
          title: 'Flutter Theme Provider',
          theme: themeProvider.darkTheme ? ThemeData.dark() : ThemeData.light(),
          home: const HomePage(),
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}
