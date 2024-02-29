import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountsTab extends StatelessWidget {
  AccountsTab({super.key});

  // TODO: Bring it up to model
  final currencyFormatter = NumberFormat.simpleCurrency(name: "USD");

  Widget _createAccount(BuildContext context, {required IconData icon, required String name, required double balance}) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.white, size: 30,),
        ),
        const SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: Theme.of(context).textTheme.titleMedium),
            Text(currencyFormatter.format(balance), style: Theme.of(context).textTheme.labelLarge)
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      shrinkWrap: true,
      children: [
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Общий баланс", style: Theme.of(context).textTheme.titleLarge),
            Text(currencyFormatter.format(1234), style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
        const SizedBox(height: 10,),

        _createAccount(context, icon: Icons.account_balance_wallet, name: "Кошелек", balance: 101),
        const SizedBox(height: 10,),
        _createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),_createAccount(context, icon: Icons.credit_card, name: "Карта", balance: 101),
        const SizedBox(height: 10,),
        const Divider(color: Colors.black, thickness: 0.5,),
        const SizedBox(height: 10,),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 2,
                  color: Colors.black
                )
              ),
              child: Icon(Icons.add, color: Colors.black, size: 30,),
            ),
            const SizedBox(width: 10,),
            Text("Добавить счет", style: Theme.of(context).textTheme.titleMedium)
          ],
        )
      ],
    );
  }
}
