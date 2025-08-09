import 'package:chatbox/Screens/transactions/bottom.dart';
import 'package:chatbox/Screens/transactions/income.dart';
import 'package:chatbox/Screens/transactions/transfer.dart';
import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  @override
  _ExpenseTrackerPageState createState() => _ExpenseTrackerPageState();
}

class _ExpenseTrackerPageState extends State<Expense> {
  String? selectedCategory;
  String? selectedWallet;
  bool isRepeat = false;
  String? selectedType = 'Expense';
  TextEditingController amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE53E3E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: DropdownButton<String>(
            value: selectedType,
            underline: Container(),
            dropdownColor: Colors.white,
            style: const TextStyle(color: Colors.black),
            items: <String>[
              'Expense',
              'Income',
              'Transfer',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              );
            }).toList(),
            onChanged: (String? newValue) {
              if (newValue == 'Income') {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Income()));
              }
              if (newValue == 'Transfer') {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Transfer()));
              }
            },
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "How much?",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  controller: amount,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "₹0",
                    hintStyle: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Bottom(
                selectedCategory: selectedCategory,
                selectedWallet: selectedWallet,
                isRepeat: isRepeat,
                amount: amount.text,
                selectedtype: selectedType,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
