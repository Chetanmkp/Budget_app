import 'package:chatbox/Screens/transactions/addpage.dart';
import 'package:chatbox/Screens/transactions/bottom.dart';
import 'package:chatbox/Screens/transactions/income_botton.dart';
import 'package:chatbox/Screens/transactions/transfer.dart';
import 'package:flutter/material.dart';

class Income extends StatefulWidget {
  const Income({super.key});

  @override
  State<Income> createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  String? selectedValue = "Income";
  String? selectedCategory;
  String? selectedWallet;
  bool isRepeat = false;
  TextEditingController amount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: DropdownButton<String>(
          value: selectedValue,
          items: <String>[
            'Expense',
            'Income',
            'Transfer',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue == 'Expense') {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Expense()));
            }
            if (newValue == 'Transfer') {
              //Navigator.push(context,
              // MaterialPageRoute(builder: (context) => Transfer()));
            }
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
            child: Text("How much?",
                style: TextStyle(
                    fontSize: 20, color: Colors.white.withOpacity(0.7))),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 60, color: Colors.white),
                  controller: amount,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true, // Adds background color for visibility
                    fillColor: Colors.green,
                    hintText: "₹0",
                    hintStyle: TextStyle(color: Colors.white, fontSize: 60),
                  ))),
          Expanded(
              child: BottomSheet(
                  onClosing: () {},
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(70),
                      ),
                      height: 500,
                      child: Center(
                        child: IncomeBotton(
                          selectedtype: selectedValue,
                          amount: amount.text,
                          selectedCategory: selectedCategory,
                          selectedWallet: selectedWallet,
                          isRepeat: isRepeat,
                        ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
