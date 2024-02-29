import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  Widget _createCategory(
      BuildContext context,
      {
        required IconData icon,
        required String name
      }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.white, size: 30,),
        ),
        const SizedBox(height: 5,),
        Text(name, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelLarge)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 20),
      children: [
        const SizedBox(height: 20,),
        Text("Категории дохода", style: Theme.of(context).textTheme.titleMedium),
        const Divider(
          color: Colors.black,
          thickness: 0.5,
        ),
        GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 4,
          children: [
            _createCategory(context, icon: Icons.sports_basketball_rounded, name: "Спорт"),
            _createCategory(context, icon: Icons.cast_for_education, name: "Образование"),
            _createCategory(context, icon: Icons.sports_basketball_rounded, name: "Спорт"),
            _createCategory(context, icon: Icons.business_center, name: "Организация"),
            _createCategory(context, icon: Icons.directions_bus_rounded, name: "Транспорт"),
            _createCategory(context, icon: Icons.business_center, name: "Организация"),
            _createCategory(context, icon: Icons.sports_basketball_rounded, name: "Спорт"),
            _createCategory(context, icon: Icons.business_center, name: "Организация"),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    width: 2
                  )
                ),
                child: const Icon(Icons.add, color: Colors.black, size: 30,),
              ),
              const SizedBox(height: 5,),
              Text("Добавить", overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelLarge)
            ],
          )],
        ),

        Text("Категории расхода", style: Theme.of(context).textTheme.titleMedium),
        const Divider(
          color: Colors.black,
          thickness: 0.5,
        ),
        GridView.count(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 4,
          children: [
            _createCategory(context, icon: Icons.sports_basketball_rounded, name: "Спорт"),
            _createCategory(context, icon: Icons.cast_for_education, name: "Образование"),
            _createCategory(context, icon: Icons.sports_basketball_rounded, name: "Спорт"),
            _createCategory(context, icon: Icons.business_center, name: "Организация"),
            _createCategory(context, icon: Icons.directions_bus_rounded, name: "Транспорт"),
            _createCategory(context, icon: Icons.business_center, name: "Организация"),
            _createCategory(context, icon: Icons.sports_basketball_rounded, name: "Спорт"),
            _createCategory(context, icon: Icons.business_center, name: "Организация"),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.black,
                          width: 2
                      )
                  ),
                  child: const Icon(Icons.add, color: Colors.black, size: 30,),
                ),
                const SizedBox(height: 5,),
                Text("Добавить", overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.labelLarge)
              ],
            )],
        )
      ]
    );
  }
}
