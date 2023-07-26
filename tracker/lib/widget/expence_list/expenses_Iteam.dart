import 'package:flutter/material.dart';
import 'package:tracker/module/Expenxe.dart';

class ExpensesIteam extends StatelessWidget {
  const ExpensesIteam(this.expence, {super.key});

  final Expence expence;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expence.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text('\$${expence.amount.toStringAsFixed(1)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expence.category]),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(expence.formatedDate),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
