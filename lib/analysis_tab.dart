import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// TODO: Bring it up to model
final currencyFormatter = NumberFormat.simpleCurrency(name: "USD");
final percentFormatter = NumberFormat.decimalPercentPattern(decimalDigits: 2);

class SourceInfo {
  String sourceName;
  double balance;
  double percentage;

  double minTransaction;
  double avgTransaction;
  double maxTransaction;

  SourceInfo(
      {required this.sourceName,
      required this.balance,
      required this.percentage,
      required this.minTransaction,
      required this.avgTransaction,
      required this.maxTransaction});
}

class AnalysisTab extends StatelessWidget {
  const AnalysisTab({super.key});

  Widget _createAnalysisRecord(BuildContext context,
      {required IconData icon,
      required String name,
      required double percent,
      required double balance,
      required List<SourceInfo> sources}) {
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
                  Text(currencyFormatter.format(balance),
                      style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ],
          ),
          Text(percentFormatter.format(percent),
              style: Theme.of(context).textTheme.labelLarge)
        ],
      ),
    ];

    if (sources.isNotEmpty) {
      recordContent.addAll([
        const SizedBox(height: 10,),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: sources.length,
            itemBuilder: (_, index) {
              final currentSource = sources[index];

              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(currentSource.sourceName,
                                style: Theme.of(context).textTheme.titleMedium),
                            Text(
                                currencyFormatter.format(currentSource.balance),
                                style: Theme.of(context).textTheme.titleSmall),
                          ],
                        ),
                        Text(percentFormatter.format(currentSource.percentage),
                            style: Theme.of(context).textTheme.labelLarge)
                      ],
                    ),


                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("мин:",
                                  style: Theme.of(context).textTheme.titleSmall),
                              Text(
                                  currencyFormatter.format(currentSource.minTransaction),
                                  style: Theme.of(context).textTheme.labelMedium),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("сред.:",
                                  style: Theme.of(context).textTheme.titleSmall),
                              Text(
                                  currencyFormatter.format(currentSource.avgTransaction),
                                  style: Theme.of(context).textTheme.labelMedium),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("макс:",
                                  style: Theme.of(context).textTheme.titleSmall),
                              Text(
                                  currencyFormatter.format(currentSource.maxTransaction),
                                  style: Theme.of(context).textTheme.labelMedium),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            })
      ]);
    }

    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: recordContent);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Общий баланс",
                  style: Theme.of(context).textTheme.titleLarge),
              Text(currencyFormatter.format(1234),
                  style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
          const Divider(
            thickness: 0.5,
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Расходы", style: Theme.of(context).textTheme.titleMedium),
              Text(currencyFormatter.format(-20),
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          _createAnalysisRecord(context,
              icon: Icons.business_center,
              name: "Питание",
              percent: 0.05,
              balance: 2.5,
              sources: []),
          const SizedBox(
            height: 10,
          ),
          _createAnalysisRecord(context,
              icon: Icons.directions_bus_filled,
              name: "Транспорт",
              percent: 0.2525,
              balance: 30,
              sources: [
                SourceInfo(
                    sourceName: "Автобус",
                    balance: 10,
                    percentage: 0.33,
                    minTransaction: 2,
                    avgTransaction: 2,
                    maxTransaction: 2),

                SourceInfo(
                    sourceName: "Троллейбус",
                    balance: 10,
                    percentage: 0.33,
                    minTransaction: 2,
                    avgTransaction: 2,
                    maxTransaction: 2),

                SourceInfo(
                    sourceName: "Трамвай",
                    balance: 10,
                    percentage: 0.33,
                    minTransaction: 2,
                    avgTransaction: 2,
                    maxTransaction: 2)
              ]),

          const Divider(
            thickness: 0.5,
            color: Colors.black,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Доходы", style: Theme.of(context).textTheme.titleMedium),
              Text(currencyFormatter.format(20),
                  style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),

          const SizedBox(
            height: 10,
          ),

          _createAnalysisRecord(context,
              icon: Icons.money,
              name: "Зарплата",
              percent: 0.05,
              balance: 2.5,
              sources: []),

          const SizedBox(
            height: 10,
          ),

          _createAnalysisRecord(context,
              icon: Icons.add_business,
              name: "Подработка",
              percent: 0.05,
              balance: 2.5,
              sources: []),
        ],
      ),
    );
  }
}
