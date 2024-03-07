import 'package:accountify/accounts_tab.dart';
import 'package:accountify/analysis_tab.dart';
import 'package:accountify/categories_tab.dart';
import 'package:accountify/records_tab.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NavigationTab {
  String Function() headerBuilder;
  Widget tab;

  NavigationTab({required this.headerBuilder, required this.tab});
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int _tabIndex = 3;
  late NavigationTab _currentTab = tabs[_tabIndex];
  bool isSearchBarOpened = false;

  List<NavigationTab> tabs = [
    NavigationTab(headerBuilder: () => "Счета", tab: AccountsTab()),
    NavigationTab(headerBuilder: () => "Категории", tab: CategoriesTab()),
    NavigationTab(
        headerBuilder: () {
          DateTime currentDate = DateTime.now();

          return DateFormat.yMMMM("ru_RU").format(currentDate);
        },
        tab: RecordsTab()),
    NavigationTab(
        headerBuilder: () {
          DateTime currentDate = DateTime.now();

          return DateFormat.yMMMM("ru_RU").format(currentDate);
        },
        tab: AnalysisTab()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(),
      endDrawer: SafeArea(
        child: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Тип записи",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Wrap(
                  spacing: 5,
                  children: [
                    Chip(label: Text("Расход")),
                    Chip(label: Text("Доход")),
                    Chip(label: Text("Перевод")),
                  ],
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0.5,
                ),
                Text(
                  "Счет",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Wrap(
                  spacing: 5,
                  children: [
                    FilterChip(
                      label: Text("Карта"),
                      onSelected: (bool value) {},
                    ),
                    Chip(label: Text("Кошелек")),
                  ],
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0.5,
                ),
                Text(
                  "Категория расхода",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Wrap(
                  spacing: 5,
                  children: [
                    Chip(label: Text("Питание")),
                    Chip(label: Text("Транспорт")),
                    Chip(label: Text("Спорт")),
                    Chip(label: Text("Транспорт")),
                    Chip(label: Text("Питание")),
                    Chip(label: Text("Спорт")),
                    Chip(label: Text("Питание")),
                  ],
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0.5,
                ),
                Text(
                  "Категория дохода",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Wrap(
                  spacing: 5,
                  children: [
                    Chip(label: Text("Зарплата")),
                    Chip(label: Text("Пенсия")),
                    Chip(label: Text("Стипендия")),
                    Chip(label: Text("Подработка")),
                  ],
                ),
                const Divider(
                  color: Colors.black,
                  thickness: 0.5,
                ),
                Container(
                    alignment: Alignment.topRight,
                    child:
                        TextButton(onPressed: () {}, child: Text("Применить")))
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: (_tabIndex == 2)
            ? () {
                if (!isSearchBarOpened) {
                  return [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            isSearchBarOpened = true;
                          });
                        },
                        icon: Icon(Icons.search))
                  ];
                }

                return [
                  IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState!.openEndDrawer();
                      },
                      icon: Icon(Icons.filter_list))
                ];
              }()
            : [Container()],
        leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: Icon(Icons.settings)),
        title: isSearchBarOpened
            ? Stack(
                children: [
                  TextField(
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                    cursorColor: Colors.white,
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: "Поиск...",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white))),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.mic_rounded)))
                ],
              )
            : const Text("Accountify"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
            height: 50,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: Text(_currentTab.headerBuilder(),
                  style: TextStyle(fontSize: 20)),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_currentTab.tab],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        child: NavigationBar(
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.wallet),
                selectedIcon: Icon(Icons.wallet, color: Colors.black),
                label: "Счета"),
            NavigationDestination(
                icon: Icon(Icons.category),
                selectedIcon: Icon(Icons.category, color: Colors.black),
                label: "Категории"),
            NavigationDestination(
                icon: Icon(Icons.edit_note_outlined),
                selectedIcon:
                    Icon(Icons.edit_note_outlined, color: Colors.black),
                label: "Записи"),
            NavigationDestination(
                icon: Icon(Icons.analytics),
                selectedIcon: Icon(Icons.analytics, color: Colors.black),
                label: "Анализ"),
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
