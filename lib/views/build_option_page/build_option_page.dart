import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_builder_app/routes/app_routes.dart';

class BuildOptionPage extends StatefulWidget {
  const BuildOptionPage({super.key});

  @override
  State<BuildOptionPage> createState() => _BuildOptionPageState();
}

class _BuildOptionPageState extends State<BuildOptionPage> {
  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.grey),
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Build Option Page"),
      ),
      body: Column(
        children: AppRoutes.allOptions
            .map(
              (e) => ListTile(
                leading: Image.asset(
                  e['icon'],
                  height: 25,
                ),
                title: Text(e['title']),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(e['route']);
                  },
                  icon: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            )
            .toList(),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.pdfPage);
        },
        icon: const Icon(Icons.picture_as_pdf_outlined),
        label: const Text("Generate PDF"),
      ),
    );
  }
}
