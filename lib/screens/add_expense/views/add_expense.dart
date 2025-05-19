import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:khutruke/screens/add_expense/views/categories.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectDate = DateTime.now();

  @override
  void initState() {
    dateController.text = DateFormat('EEE, MM/dd/yyyy').format(DateTime.now());
    // expenseController.text = 'Rs 0.00';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Text(
              //   'Add Expense',
              //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              // ),
              // SizedBox(height: 32),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],
                  controller: expenseController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      FontAwesomeIcons.indianRupeeSign,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                    labelText: 'Enter Amount',
                    labelStyle: TextStyle(color: Colors.grey.shade600),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32),
              TextFormField(
                controller: categoryController,
                readOnly: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => Categories(
                            onCategorySelected: (selectedCategory) {
                              categoryController.text = selectedCategory;
                            },
                          ),
                    ),
                  );
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    FontAwesomeIcons.list,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  labelText: 'Category',
                  labelStyle: TextStyle(color: Colors.grey.shade600),
                  suffixIcon: Icon(
                    FontAwesomeIcons.caretDown,
                    size: 20,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),

              SizedBox(height: 32),
              TextFormField(
                controller: dateController,
                readOnly: true,
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: selectDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(Duration(days: 365)),
                  );
                  if (newDate != null) {
                    dateController.text = DateFormat(
                      'EEE, MM/dd/yyyy',
                    ).format(newDate);
                    selectDate = newDate;
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    FontAwesomeIcons.calendarDay,
                    size: 16,
                    color: Colors.grey.shade600,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  label: Text(
                    'Date',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ),
              ),
              SizedBox(height: 32),

              //for save button to move it to the bottom
              Spacer(),
              Container(
                width: double.infinity,
                height: kToolbarHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.tertiary,
                    ],
                    transform: const GradientRotation(pi / 4),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: () {
                    // print('Saved pressed');
                  },
                  // style: TextButton.styleFrom(
                  //   backgroundColor: Theme.of(context).colorScheme.primary,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(20),
                  //   ),
                  // ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
