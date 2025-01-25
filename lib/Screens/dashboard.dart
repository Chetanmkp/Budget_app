/*import 'package:chatbox/Screens/profile.dart';
import 'package:chatbox/Screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashBoard();
}

class _DashBoard extends State<Dashboard> {
  var user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SplashScreen()),
              );
            },
            icon: Icon(Icons.logout),
          )
        ],
        title: Center(
          child: DropdownButton<String>(
            value: 'January', // Set the initial value
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
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text("Account Balance",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                Text("₹ 17,000",
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: 75,
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          color: Colors.green,
                          child: Column(
                            children: [
                              Text('Income',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Text('32,00',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 75,
                        child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          color: Colors.red,
                          child: Column(
                            children: [
                              Text(
                                'Expense',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '15,000',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
*/
import 'package:chatbox/Screens/profile.dart';
import 'package:chatbox/Screens/splash_screen.dart';
import 'package:chatbox/Screens/trans.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashBoard();
}

class _DashBoard extends State<Dashboard> {
  var user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Card(
                elevation: 10,
                color: Color.fromRGBO(248, 245, 239, 1),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: dash()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Spend Frequency",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Container(
              height: 175,
              width: double.infinity,
              child: AspectRatio(
                  aspectRatio: 1.5,
                  child: LineChart(
                    LineChartData(
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 17000),
                            FlSpot(1, 18000),
                            FlSpot(2, 17000),
                            FlSpot(3, 19000),
                            FlSpot(4, 17000),
                            FlSpot(5, 17000),
                          ],
                          isCurved: true,
                          color: Colors.purple,
                          barWidth: 4,
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.purple.withOpacity(0.3),
                                Colors.purple.withOpacity(0.1),
                                Colors.transparent
                              ],
                            ),
                          ),
                        ),
                      ],
                      titlesData: FlTitlesData(show: false),
                      gridData: FlGridData(show: false),
                      borderData: FlBorderData(show: false),
                    ),
                  )),
            ),
            SizedBox(height: 20),
            week(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: recent(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomnavigation(),
    );
  }

  Widget dash() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: DropdownButton<String>(
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
          ),
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SplashScreen()),
              );
            },
            icon: Icon(Icons.logout),
          )
        ],
      ),
      Center(
          child: Column(
        children: [
          SizedBox(height: 20),
          Text("Account Balance",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          Text("₹ 17,000",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  height: 75,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Income',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text('32,000',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 75,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Expense',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '15,000',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      )),
      SizedBox(
        height: 20,
      )
    ]);
  }

  Widget week() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Container(
            width: 80,
            child: Card(
              color: Colors.amber,
              child: Center(
                child: Text(
                  "Today",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(width: 40),
          Text(
            "Week",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(width: 40),
          Text(
            "Month",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(width: 40),
          Text(
            "Year",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget recent() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Recent Transcations",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(width: 40),
            ElevatedButton(onPressed: () {}, child: Text("Show all"))
          ],
        ),
        _TransactionItem(
          title: 'Shopping',
          amount: '-\$120',
          time: '10:00 AM',
        ),
        SizedBox(height: 8.0),
        _TransactionItem(
          title: 'Subscription',
          amount: '-\$80',
          time: '03:30 PM',
        ),
      ],
    );
  }

  Widget bottomnavigation() {
    return BottomNavigationBar(
      type: BottomNavigationBarType
          .fixed, // This ensures all items are always visible
      currentIndex: 0, // You might want to manage this state
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
            // Already on Home page
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

class _TransactionItem extends StatelessWidget {
  final String title;
  final String amount;
  final String time;

  const _TransactionItem({
    required this.title,
    required this.amount,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Icon(Icons.shopping_bag, color: Colors.grey),
        ),
        SizedBox(width: 12.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 4.0),
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
        Text(
          amount,
          style: TextStyle(
            color: amount.startsWith('-') ? Colors.red : Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
