import 'package:flutter/material.dart';
import 'package:tracker/widget/Expenses_list.dart';
import 'package:tracker/widget/new_expences.dart';

import '../../module/Expenxe.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expence> _registerExpenses = [
    Expence(
        title: "fluttercccccccccccccccccccvvvvvvvvvvvvvv",
        amount: 19.0,
        date: DateTime.now(),
        category: Category.work),
    Expence(
        title: "cienimaaaaaaaaaaaaaaaaaaaaabbbbbbbbbbbbb",
        amount: 18.6,
        date: DateTime.now(),
        category: Category.lesisure),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpenses(onAddExpences: _addExpenses),
    );
  }

  void _addExpenses(Expence expence) {
    setState(() {
      _registerExpenses.add(expence);
    });
  }

  void _removeExpence(Expence expence) {
    final expenseIndex = _registerExpenses.indexOf(expence);
    setState(() {
      _registerExpenses.remove(expence);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 3),
      content: Text("Expence deleted"),
      action: SnackBarAction(
        label: 'undo',
        onPressed: () {
          setState(() {
            _registerExpenses.insert(expenseIndex, expence);
          });
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);

    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text("no expenses found"),
    );

    if (_registerExpenses.isNotEmpty) {
      mainContent = ExpenceLIst(
        expence: _registerExpenses,
        onRemoveExpence: _removeExpence,
      );
    }
    return Scaffold(
      appBar: AppBar(title: const Text("track the way"), actions: [
        IconButton(
            onPressed: () {
              _openAddExpenseOverlay();
            },
            icon: const Icon(Icons.add))
      ]),
      body: width < 600
          ? Column(
              children: [
                const Text("cghjkljjjjjjjjjj"),
                Expanded(child: mainContent),
              ],
            )
          : Container(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv"),
                  Expanded(child: mainContent)
                ],
              ),
            ),
    );
  }
}
