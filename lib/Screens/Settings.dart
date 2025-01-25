import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          title: Text('Settings'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text('Currency'),
              trailing: Text('USD'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Language'),
              trailing: Text('English'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Theme'),
              trailing: Text('Dark'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Security'),
              trailing: Text('Fingerprint'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Notification'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              title: Text('About'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              title: Text('Help'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ],
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
