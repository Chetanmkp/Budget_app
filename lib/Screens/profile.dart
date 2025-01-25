import 'package:chatbox/Screens/Settings.dart';
import 'package:chatbox/Screens/dashboard.dart';
import 'package:chatbox/Screens/trans.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _Settings_pageState();
}

class _Settings_pageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 245, 239, 1),
      appBar: AppBar(
        title: Text('User Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 75,
                width: 75,
                child: Image.asset('Assets/Images/123.jpg')),
            SizedBox(height: 16.0),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            list(),
          ],
        ),
      ),
      bottomNavigationBar: bottomnavigation(context),
    );
  }

  Widget list() {
    return Container(
      height: 275,
      child: Card(
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.account_circle, size: 25),
              title: Text('Account', style: TextStyle(fontSize: 25)),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
              child: ListTile(
                leading: Icon(Icons.settings, size: 25),
                title: Text('Settings', style: TextStyle(fontSize: 25)),
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.upload, size: 25),
              title: Text('Export Data', style: TextStyle(fontSize: 25)),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.logout, size: 25),
              title: Text('Logout', style: TextStyle(fontSize: 25)),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomnavigation(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType
          .fixed, // This ensures all items are always visible
      currentIndex: 4, // You might want to manage this state
      selectedItemColor: Colors.purple, // Accent color for selected item
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: 'Transactions',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle,
              size: 40), // Make the '+' button slightly larger
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Dashboard()));
            break;
          case 1:
            // Navigate to Transactions page
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ExpenseTrackerPage()));
            break;
          case 2:
            // Open Add Transaction modal or page
            // Navigator.push(context, MaterialPageRoute(builder: (context) => AddTransactionPage()));
            break;
          case 3:
            // Navigate to Budget page
            // Navigator.push(context, MaterialPageRoute(builder: (context) => BudgetPage()));
            break;
          case 4:
            // Navigate to Profile page
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserProfilePage()));
            break;
        }
      },
    );
  }
}
