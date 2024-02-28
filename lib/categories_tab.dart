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
        Text(name)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 20),
      children: [
        const SizedBox(height: 20,),
        const Text("Категории дохода"),
        const Divider(
          color: Colors.black,
          thickness: 0.5,
        )
      ]
    );
  }
}
