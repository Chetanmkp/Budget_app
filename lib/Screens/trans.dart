import 'package:chatbox/Screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:chatbox/Screens/dashboard.dart';

class ExpenseTrackerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1),
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton<String>(
                value: 'January',
                items: <String>[
                  'January',
                  'February',
                  'March',
                  'April',
                  'May',
                  'June',
                  'July',
                  'August',
                  'September',
                  'October',
                  'November',
                  'December'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // Handle dropdown value change
                },
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to financial report page
                },
                child: Container(
                  width: double.infinity,
                  height: 40,
                  child: Card(
                    color: const Color.fromRGBO(238, 229, 255, 1),
                    child: Center(
                      child: Text(
                        'See your financial report                    >',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "Today",
                style: TextStyle(fontSize: 30),
              ),
              ExpenseItem(
                icon: Icons.shopping_cart,
                title: 'Shopping',
                amount: -120.0,
                time: '10:00 AM',
              ),
              SizedBox(height: 10.0),
              ExpenseItem(
                icon: Icons.subscriptions,
                title: 'Subscription',
                amount: -80.0,
                time: '03:30 PM',
              ),
              SizedBox(height: 10.0),
              ExpenseItem(
                icon: Icons.restaurant,
                title: 'Food',
                amount: -32.0,
                time: '07:30 PM',
              ),
              SizedBox(height: 10.0),
              ExpenseItem(
                icon: Icons.directions_car,
                title: 'Transportation',
                amount: -18.0,
                time: '08:30 PM',
              ),
              SizedBox(height: 10.0),
              ExpenseItem(
                icon: Icons.directions_bike,
                title: 'Bike EMI',
                amount: -50.0,
                time: '09:30 PM',
              ),
              Text(
                "Yesterday",
                style: TextStyle(fontSize: 30),
              ),
              ExpenseItem(
                icon: Icons.directions_bike,
                title: 'Tv EMI',
                amount: -50.0,
                time: '09:30 PM',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomnavigation(context),
    );
  }

  Widget bottomnavigation(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType
          .fixed, // This ensures all items are always visible
      currentIndex: 1, // You might want to manage this state
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

class ExpenseItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final double amount;
  final String time;

  ExpenseItem({
    required this.icon,
    required this.title,
    required this.amount,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.maxFinite,
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon, color: Colors.grey),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '\$${amount.toStringAsFixed(2)}',
                style: TextStyle(
                  color: amount < 0 ? Colors.red : Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
