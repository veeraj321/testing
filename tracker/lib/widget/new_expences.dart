import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tracker/module/Expenxe.dart';

final formate = DateFormat.yMd();

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key, required this.onAddExpences});

  final void Function(Expence expence) onAddExpences;
  @override
  State<NewExpenses> createState() => _NewExpensesState();
}

class _NewExpensesState extends State<NewExpenses> {
  final _enteredTitle = TextEditingController();
  final _enteredamount = TextEditingController();
  DateTime? _selectedDate;
  Category _selectediteams = Category.work;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenses() {
    final enteredAmount = double.tryParse(_enteredamount.text);
    final amoount = enteredAmount == null || enteredAmount <= 0;
    if (_enteredTitle.text.trim().isEmpty || amoount || _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("invalid input"),
          content: const Text("plz enter the vaild data"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("okay"))
          ],
        ),
      );
      return;
    }

    widget.onAddExpences(Expence(
        title: _enteredTitle.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectediteams));
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _enteredTitle.dispose();
    _enteredamount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboard = MediaQuery.of(context).viewInsets.bottom;
    print('${keyboard}lllllllllllll');
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        print(constraints.maxWidth);
        print(constraints.minWidth);
        return (width <= 600)
            ? SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, keyboard + 16),
                    child: Column(
                      children: [
                        TextField(
                          controller: _enteredTitle,
                          maxLength: 50,
                          decoration: InputDecoration(
                            label: Text("Title"),
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _enteredamount,
                                maxLength: 15,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  prefixText: '\$ ',
                                  label: Text("amount"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(_selectedDate == null
                                      ? "no date selected"
                                      : formate.format(_selectedDate!)),
                                  IconButton(
                                    onPressed: () {
                                      _presentDatePicker();
                                    },
                                    icon: const Icon(Icons.calendar_month),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            DropdownButton(
                                value: _selectediteams,
                                items: Category.values
                                    .map(
                                      (category) => DropdownMenuItem(
                                        value: category,
                                        child: Text(category.name),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (values) {
                                  setState(() {
                                    _selectediteams = values!;
                                  });
                                }),
                            Spacer(),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("cancel")),
                            ElevatedButton(
                                onPressed: () {
                                  _submitExpenses();
                                },
                                child: Text("save"))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            : SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, keyboard + 16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _enteredTitle,
                                maxLength: 50,
                                decoration: InputDecoration(
                                  label: Text("Title"),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: TextField(
                                controller: _enteredamount,
                                maxLength: 15,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  prefixText: '\$ ',
                                  label: Text("amount"),
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  DropdownButton(
                                      value: _selectediteams,
                                      items: Category.values
                                          .map(
                                            (category) => DropdownMenuItem(
                                              value: category,
                                              child: Text(category.name),
                                            ),
                                          )
                                          .toList(),
                                      onChanged: (values) {
                                        setState(() {
                                          _selectediteams = values!;
                                        });
                                      }),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(_selectedDate == null
                                            ? "no date selected"
                                            : formate.format(_selectedDate!)),
                                        IconButton(
                                          onPressed: () {
                                            _presentDatePicker();
                                          },
                                          icon:
                                              const Icon(Icons.calendar_month),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("cancel")),
                            ElevatedButton(
                                onPressed: () {
                                  _submitExpenses();
                                },
                                child: Text("save")),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
