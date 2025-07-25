import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:khutruke/screens/add_expense/views/categories.dart';
import 'package:khutruke/src/expense.dart';
import 'package:khutruke/src/expense_service.dart';

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
  final expenseService = ExpenseService();
  bool isSaving = false;

  @override
  void initState() {
    dateController.text = DateFormat('EEE, MM/dd/yyyy').format(DateTime.now());
    // expenseController.text = 'Rs 0.00';
    super.initState();
  }

  Future<void> _saveExpense() async {
    final amount = double.tryParse(expenseController.text);
    final category = categoryController.text;
    final date = selectDate;

    if ((amount != null && amount > 0.0) && category.isNotEmpty) {
      setState(() {
        isSaving = true; // Start loading
      });

      final newExpense = Expense(
        amount: amount,
        category: category,
        date: date,
      );

      try {
        await expenseService.addExpense(newExpense);

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Expense Added Successfully!',
              style: TextStyle(
                color: Colors.green.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );

        Navigator.pop(context);
      } catch (e, stack) {
        print('Error adding expense: $e');
        print('Stack trace: $stack');

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to save expense.',
              style: TextStyle(
                color: Colors.red.shade900,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      } finally {
        if (mounted) {
          setState(() {
            isSaving = false; // Stop loading
          });
        }
      }
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please fill all fields correctly. Note: Please enter an amount greater than 0.',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
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
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
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
                      firstDate: DateTime.now().subtract(Duration(days: 365)),
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
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      FontAwesomeIcons.noteSticky,
                      size: 16,
                      color: Colors.grey.shade600,
                    ),
                    labelText: 'Notes',
                    labelStyle: TextStyle(color: Colors.grey.shade600),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ], // <-- Add this closing bracket for the children list
            ),
          ),
        ),
        //for save button to move it to the bottom
        // Spacer(),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom:
                MediaQuery.of(context).viewInsets.bottom +
                16, // stays above keyboard
          ),
          child: SizedBox(
            height: kToolbarHeight,
            width: double.infinity,
            child: DecoratedBox(
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
                onPressed: isSaving ? null : _saveExpense,
                child:
                    isSaving
                        ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                        : const Text(
                          'Save',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
