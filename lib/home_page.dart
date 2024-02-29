import 'package:accountify/accounts_tab.dart';
import 'package:accountify/categories_tab.dart';
import 'package:flutter/material.dart';

class NavigationTab {
  String name;
  Widget tab;

  NavigationTab({required this.name, required this.tab});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tabIndex = 1;
  late NavigationTab _currentTab = tabs[_tabIndex];

  List<NavigationTab> tabs = [
    NavigationTab(
      name: "Счета",
      tab: AccountsTab()
    ),
    NavigationTab(
      name: "Категории",
      tab: CategoriesTab()
    ),
    NavigationTab(
      name: "Счет",
      tab: AccountsTab()
    ),
    NavigationTab(
      name: "Счет",
      tab: AccountsTab()
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))
        // ),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        title: const Text("Accountify"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppBar(
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))
              // ),
              leading: IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
              title: const Text("Accountify"),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: Colors.black,
                height: 50,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)
                  ),
                  child: Text(_currentTab.name, style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
            _currentTab.tab
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        child: NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.wallet), selectedIcon: Icon(Icons.wallet, color: Colors.black), label: "Счета"),
            NavigationDestination(icon: Icon(Icons.category), selectedIcon: Icon(Icons.category, color: Colors.black), label: "Категории"),
            NavigationDestination(icon: Icon(Icons.edit_note_outlined), selectedIcon: Icon(Icons.edit_note_outlined, color: Colors.black), label: "Записи"),
            NavigationDestination(icon: Icon(Icons.analytics), selectedIcon: Icon(Icons.analytics, color: Colors.black), label: "Анализ"),
          ],
          onDestinationSelected: (int index) => setState(() {
            _tabIndex = index;
            _currentTab = tabs[_tabIndex];
          }),
        
          selectedIndex: _tabIndex,
          backgroundColor: Colors.black,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          indicatorColor: Colors.white,
        ),
      ),
    );
  }
}
