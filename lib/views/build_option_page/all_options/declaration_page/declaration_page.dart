import 'package:flutter/material.dart';
import 'package:resume_builder_app/utils/globals.dart';

class DeclarationPage extends StatefulWidget {
  const DeclarationPage({super.key});

  @override
  State<DeclarationPage> createState() => _DeclarationPageState();
}

class _DeclarationPageState extends State<DeclarationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Declaration Page"),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Declaration"),
                  Switch(
                    value: Globals.isChecked,
                    onChanged: (val) {
                      Globals.isChecked = val;
                      setState(() {});
                    },
                  ),
                ],
              ),
              Visibility(
                visible: Globals.isChecked,
                child: FlutterLogo(
                  size: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
