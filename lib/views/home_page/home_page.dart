import 'package:flutter/material.dart';
import 'package:resume_builder_app/routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.black,
          // foregroundColor: Colors.white,
          title: const Text("Home Page"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              AppRoutes.buildOptionPage,
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
