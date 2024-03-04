import 'package:accountify/accounts_tab.dart';
import 'package:accountify/categories_tab.dart';
import 'package:accountify/records_tab.dart';
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
  int _tabIndex = 2;
  late NavigationTab _currentTab = tabs[_tabIndex];
  bool isSearchBarOpened = false;

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
      name: "Записи",
      tab: RecordsTab()
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
        actions: (_tabIndex == 2) ? [
          IconButton(onPressed: () {
            setState(() {
              isSearchBarOpened = true;
            });
          },
          icon: Icon(Icons.search))
        ] : [],
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.settings)),
        title: isSearchBarOpened ? TextField(
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.white
          ),
          cursorColor: Colors.white,
          autofocus: true,
          decoration: InputDecoration(
            hintText: "Поиск...",
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.white
            ),

            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white
              )
            ),

            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white
              )
            )
          ),
        ) : const Text("Accountify"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40))
            ),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
