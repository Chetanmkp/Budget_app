import 'package:chatbox/Screens/transactions/addpage.dart';
import 'package:chatbox/Screens/transactions/income.dart';
import 'package:flutter/material.dart';

class Transfer extends StatefulWidget {
  const Transfer({super.key});

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  String dropdownValue = 'Transfer';
  String? selectedCategory;
  String? selectedWallet;
  bool isRepeat = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: DropdownButton<String>(
            value: dropdownValue,
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Expense()));
              }
              if (newValue == 'Income') {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Income()));
              }
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 200),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
              child: Text("How much?",
                  style: TextStyle(
                      fontSize: 20, color: Colors.white.withOpacity(0.7))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
              child: Text("₹0",
                  style: TextStyle(fontSize: 60, color: Colors.white)),
            ),
            Expanded(
                child: BottomSheet(
                    onClosing: () {},
                    builder: (BuildContext context) {
                      return Container(
                        height: 400,
                        child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Description',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            Row(
                              children: [],
                            )
                          ],
                        ),
                      );
                    })),
          ],
        ));
  }
}
