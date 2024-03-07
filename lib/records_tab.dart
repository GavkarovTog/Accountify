import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RecordsTab extends StatelessWidget {
  RecordsTab({super.key});

  // TODO: Bring it up to model
  final currencyFormatter = NumberFormat.simpleCurrency(name: "USD");

  Widget _createRecord(
    BuildContext context, {
    required IconData icon,
    required String name,
    required String card,
    required String label,
    required String direction,
    required double balance,
  }) {
    List<Widget> recordContent = [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: Theme.of(context).textTheme.titleMedium),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(card, style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(width: 10,),
                      Text(direction, style: Theme.of(context).textTheme.titleSmall)
                    ],
                  )
                ],
              ),
            ],
          ),
          Text(currencyFormatter.format(balance),
              style: Theme.of(context).textTheme.labelLarge)
        ],
      ),
    ];

    if (label.isNotEmpty) {
      recordContent.addAll([
        const SizedBox(height: 5,),
        Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: Text(label, style: Theme.of(context).textTheme.labelMedium),
        )
      ]);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: recordContent
    );
  }

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
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),

          Container(
            alignment: Alignment.bottomLeft,
            child: Text("Сегодня, 5 марта 2024 года",
                style: Theme.of(context).textTheme.titleLarge),
          ),
          Divider(
            thickness: 0.5,
            color: Colors.black,
          ),

          const SizedBox(height: 10,),

          _createRecord(context,
              icon: Icons.business_center,
              name: "Зарплата",
              card: "Карта",
              label: "",
              direction: "",
              balance: 54
          ),

          const SizedBox(
            height: 10,
          ),

          _createRecord(context,
              icon: Icons.business_center,
              name: "Питание",
              card: "Карта",
              label: "Огурец",
              direction: "",
              balance: -3.5
          ),

          const SizedBox(
            height: 10,
          ),

          _createRecord(context,
              icon: Icons.business_center,
              name: "Транспорт",
              card: "Кошелек",
              label: "Автобус, пересадка, пересадка на метро, пересадка на троллейбус, маршрутка, такси",
              direction: "",
              balance: -3.5
          ),

          const SizedBox(
            height: 10,
          ),

          _createRecord(context,
              icon: Icons.business_center,
              name: "Другое",
              label: "",
              card: "Карта",
              direction: "Интернет",
              balance: -10
          ),

          const SizedBox(height: 15,),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text("Вчера, 4 марта 2024 года",
                style: Theme.of(context).textTheme.titleLarge),
          ),
          Divider(
            thickness: 0.5,
            color: Colors.black,
          ),

          _createRecord(context,
              icon: Icons.business_center,
              name: "Транспорт",
              card: "Кошелек",
              label: "Автобус, пересадка, пересадка на метро, пересадка на троллейбус, маршрутка, такси",
              direction: "",
              balance: -3.5
          ),

          const SizedBox(
            height: 10,
          ),

          _createRecord(context,
              icon: Icons.business_center,
              name: "Транспорт",
              card: "Кошелек",
              label: "Автобус, пересадка, пересадка на метро, пересадка на троллейбус, маршрутка, такси",
              direction: "",
              balance: -3.5
          ),

          const SizedBox(
            height: 10,
          ),

          _createRecord(context,
              icon: Icons.business_center,
              name: "Транспорт",
              card: "Кошелек",
              label: "Автобус, пересадка, пересадка на метро, пересадка на троллейбус, маршрутка, такси",
              direction: "",
              balance: -3.5
          ),

        ],
      ),
    );
  }
}
