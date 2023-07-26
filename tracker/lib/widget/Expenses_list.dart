import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tracker/module/Expenxe.dart';
import 'package:tracker/widget/expence_list/expenses_Iteam.dart';

class ExpenceLIst extends StatelessWidget {
  const ExpenceLIst(
      {super.key, required this.onRemoveExpence, required this.expence});

  final List<Expence> expence;
  final void Function(Expence expence) onRemoveExpence;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expence.length,
        itemBuilder: (ctx, index) => Dismissible(
            key: ValueKey(expence[index]),
            background: Container(
              color: Colors.red,
            ),
            onDismissed: (direction) => {onRemoveExpence(expence[index])},
            child: ExpensesIteam(expence[index])));
  }
}
