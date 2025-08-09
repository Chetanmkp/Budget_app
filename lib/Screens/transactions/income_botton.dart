import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class IncomeBotton extends StatefulWidget {
  IncomeBotton(
      {super.key,
      required this.selectedCategory,
      required this.selectedWallet,
      required this.isRepeat,
      required this.amount,
      required this.selectedtype});
  String? selectedCategory;
  String? selectedWallet;
  bool isRepeat;
  String amount;
  String? selectedtype;

  @override
  State<IncomeBotton> createState() => _BottomState(
        selectedtype: selectedtype,
        amount: amount,
        selectedCategory: selectedCategory,
        selectedWallet: selectedWallet,
        isRepeat: isRepeat,
      );
}

class _BottomState extends State<IncomeBotton> {
  _BottomState(
      {required this.selectedCategory,
      required this.selectedWallet,
      required this.isRepeat,
      required this.amount,
      required this.selectedtype});
  String? selectedCategory;
  String? selectedWallet;
  bool isRepeat;
  String amount = '0';
  String? selectedtype;

  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton<String>(
                  hint: Text('Category'),
                  value: selectedCategory,
                  items: ['Salary', 'Transfer']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    hintText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.0),
                DropdownButton<String>(
                  hint: Text('Wallet'),
                  menuWidth: double.infinity,
                  value: selectedWallet,
                  items: ['Bank', 'Cash']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedWallet = newValue;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle add attachment
                          },
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.attach_file),
                                Text('Add Attachment'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]),
                SizedBox(width: 20.0),
                Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Repeat",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(
                        "Repeat Transactions",
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  Switch(
                    value: isRepeat,
                    onChanged: (bool value) {
                      setState(() {
                        isRepeat = value;
                      });
                    },
                  ),
                ])
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple)),
              onPressed: () {
                DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm:ss")
                    .parse(DateTime.now().toString());
                var db = FirebaseFirestore.instance;
                String formattedTime = DateFormat('HH:mm').format(dateTime);
                var userID = FirebaseAuth.instance.currentUser!.uid;
                var data = {
                  'category': selectedCategory,
                  'description': descriptionController.text,
                  'wallet': selectedWallet,
                  'isRepeat': isRepeat,
                  'type': selectedtype,
                  'time': formattedTime,
                };
                db.collection('transactions').add(data);
                Navigator.pop(context);
              },
              child: Text(
                'Continue',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
