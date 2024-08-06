import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactInfoPage extends StatefulWidget {
  const ContactInfoPage({super.key});

  @override
  State<ContactInfoPage> createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> {
  int index = 0;
  List<Map> colors = [
    {
      'name': "RED",
      'color': Colors.red,
    },
    {
      'name': "GREEN",
      'color': Colors.green,
    },
    {
      'name': "BLUE",
      'color': Colors.blue,
    },
  ];

  void setIndex(int i) {
    index = i;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Info Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IndexedStack(
              index: index,
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: colors
                  .map(
                    (e) => Container(
                      height: 200,
                      width: 200,
                      color: e['color'],
                    ),
                  )
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: colors
                  .map(
                    (e) => ElevatedButton(
                      onPressed: () {
                        setIndex(
                          colors.indexOf(e),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: e['color'],
                          foregroundColor: Colors.white),
                      child: Text(e['name']),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
