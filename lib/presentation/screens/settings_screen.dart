import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const String routeName ="/settings";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListTile(
        title: Text("Temperature Unit"),
        subtitle: Text("Celcius/ Fahrenheit (default: Celcius)"),
        trailing: Switch.adaptive(value: true, onChanged: (value) {}),
      ),
    );
  }
}
