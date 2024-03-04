import 'package:flutter/material.dart';

class RecordsTab extends StatelessWidget {
  RecordsTab({super.key});

  final List<String> periods = [
    "За все время",
    "Год",
    "Месяц",
    "Неделя",
    "День"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 20,),
          LayoutBuilder(
            builder: (_, constraints) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 0.8 * constraints.maxWidth,
                  height: 50,
                  child: SearchBar(
                    trailing: [
                      IconButton(icon: Icon(Icons.search), onPressed: () {},),
                      IconButton(icon: Icon(Icons.mic_rounded), onPressed: () {
                      },)
                    ],
                  ),
                ),
                IconButton(icon: Icon(Icons.filter_list_outlined), onPressed: () {})
              ],
            ),
          ),

          const SizedBox(height: 10,),
          Row(
            children: [
              DropdownMenu<String>(
                initialSelection: periods.first,
                dropdownMenuEntries: periods.map((element) {
                  return DropdownMenuEntry<String>(
                      value: element,
                      label: element
                  );
                }).toList(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
