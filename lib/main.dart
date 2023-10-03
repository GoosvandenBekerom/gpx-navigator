import 'package:flutter/material.dart';
import 'package:gpx_navigator/streetmap.dart';

void main() {
  runApp(const GpxNavigator());
}

class GpxNavigator extends StatelessWidget {
  const GpxNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPX Navigator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'GPX Navigator'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: StreetMap(),
    );
  }
}
