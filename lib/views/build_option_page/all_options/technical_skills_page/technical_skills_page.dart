import 'package:flutter/material.dart';
import 'package:resume_builder_app/utils/extension.dart';
import 'package:resume_builder_app/utils/globals.dart';

class TechnicalSkillsPage extends StatefulWidget {
  const TechnicalSkillsPage({super.key});

  @override
  State<TechnicalSkillsPage> createState() => _TechnicalSkillsPageState();
}

class _TechnicalSkillsPageState extends State<TechnicalSkillsPage> {
  List<TextEditingController> allControllers = [];

  @override
  void initState() {
    if (Globals.technicalSkills.isEmpty) {
      allControllers = List.generate(
        2,
        (i) => TextEditingController(),
      );
    } else if (Globals.technicalSkills.length < 2) {
      Globals.technicalSkills.forEach((e) {
        allControllers.add(
          TextEditingController(text: e),
        );
      });
      allControllers.add(TextEditingController());
    } else {
      Globals.technicalSkills.forEach((e) {
        allControllers.add(
          TextEditingController(text: e),
        );
      });
    }

    super.initState();
  }

  @override
  void dispose() {
    Globals.technicalSkills.clear();
    for (int i = 0; i < allControllers.length; i++) {
      if (allControllers[i].text.isNotEmpty) {
        Globals.technicalSkills.add(allControllers[i].text);
      }
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Technical Skills Page"),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Enter your skills"),
              Column(
                children: List.generate(
                  allControllers.length,
                  (index) => Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: allControllers[index],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          allControllers[index].clear();
                          allControllers.removeAt(index);
                          setState(() {});
                        },
                        icon: const Icon(Icons.delete_outline),
                      ),
                    ],
                  ),
                ),
              ),
              20.h,
              ElevatedButton.icon(
                onPressed: () {
                  allControllers.add(TextEditingController());
                  setState(() {});
                },
                icon: const Icon(Icons.add),
                label: const Text("Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
