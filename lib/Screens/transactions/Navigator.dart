import 'package:chatbox/Screens/dashboard.dart';
import 'package:chatbox/Screens/profile.dart';
import 'package:chatbox/Screens/trans.dart';
import 'package:chatbox/Screens/transactions/addpage.dart';
import 'package:flutter/material.dart';

class BottomNavigator extends StatelessWidget {
  BottomNavigator({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59,
      width: double.infinity,
      decoration: const BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 20, offset: Offset(0, 20))]),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 24,
          // This ensures all items are always visible
          currentIndex: index, // You might want to manage this state
          selectedItemColor: Colors.purple, // Accent color for selected item
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.villa),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'Transactions',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
              ), // Make the '+' button slightly larger
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart),
              label: 'Budget',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            // Handle navigation based on the selected index
            switch (index) {
              case 0:
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
                break;
              case 1:
                // Navigate to Transactions page
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ExpenseTrackerPage()));
                break;
              case 2:
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Expense()));
                break;
              case 3:
                // Navigate to Budget page
                // Navigator.push(context, MaterialPageRoute(builder: (context) => BudgetPage()));
                break;
              case 4:
                // Navigate to Profile page
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => UserProfilePage()));
                break;
            }
          },
        ),
      ),
    );
  }
}
