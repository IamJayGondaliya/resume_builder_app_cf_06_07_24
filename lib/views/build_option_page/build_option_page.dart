import 'package:flutter/material.dart';

class BuildOptionPage extends StatefulWidget {
  const BuildOptionPage({super.key});

  @override
  State<BuildOptionPage> createState() => _BuildOptionPageState();
}

class _BuildOptionPageState extends State<BuildOptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Build Option Page"),
      ),
    );
  }
}
