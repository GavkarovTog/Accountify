import 'package:accountify/home_page.dart';
import 'package:flutter/material.dart';

// TODO: Don't forget to try Autocomplete widget!
void main() {
  runApp(const AccountifyApp());
}

class AccountifyApp extends StatelessWidget {
  const AccountifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context).copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          centerTitle: true
        ),
        navigationBarTheme: const NavigationBarThemeData(
          labelTextStyle: MaterialStatePropertyAll(
            TextStyle(
              color: Colors.white
            )
          ),
          iconTheme: MaterialStatePropertyAll(
            IconThemeData(
              color: Colors.white
            )
          )
        )
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

