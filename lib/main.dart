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
          centerTitle: true,
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.black
              ),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))
          ),
          surfaceTintColor: Colors.black,
          elevation: 100
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
        ),
        searchBarTheme: SearchBarThemeData(
          backgroundColor: MaterialStatePropertyAll(Colors.white),
          surfaceTintColor: MaterialStatePropertyAll(Colors.white),
          overlayColor: MaterialStatePropertyAll(Colors.transparent),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.black,
                width: 2
              ),
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          shadowColor: MaterialStatePropertyAll(Colors.transparent)
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
          menuStyle: MenuStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.white),
            surfaceTintColor: MaterialStatePropertyAll(Colors.transparent)
          ),
          inputDecorationTheme: InputDecorationTheme(
            constraints: BoxConstraints.tightFor(height: 50),
            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2
              )
            ),
          )
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.black
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

