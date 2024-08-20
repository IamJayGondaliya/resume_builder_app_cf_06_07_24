import 'package:flutter/material.dart';
import 'package:resume_builder_app/utils/globals.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  List<String> availableLanguages = [
    "Hindi",
    "English",
    "Gujarati",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Info Page"),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Select your gender"),
              RadioListTile(
                title: const Text("Male"),
                value: "Male",
                groupValue: Globals.gender,
                onChanged: (val) {
                  Globals.gender = val;
                  setState(() {});
                },
              ),
              RadioListTile(
                title: const Text("Female"),
                value: "Female",
                groupValue: Globals.gender,
                onChanged: (val) {
                  Globals.gender = val;
                  setState(() {});
                },
              ),
              Text("Select the languages: ${Globals.languages}"),
              ...availableLanguages.map(
                (e) => CheckboxListTile(
                  title: Text(e),
                  value: Globals.languages.contains(e),
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (val) {
                    if (val!) {
                      Globals.languages.add(e);
                    } else {
                      Globals.languages.remove(e);
                    }
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
