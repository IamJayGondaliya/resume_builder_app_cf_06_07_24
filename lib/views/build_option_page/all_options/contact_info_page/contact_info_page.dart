import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_builder_app/utils/extension.dart';

class ContactInfoPage extends StatefulWidget {
  const ContactInfoPage({super.key});

  @override
  State<ContactInfoPage> createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> {
  int index = 0;
  bool hide = true;

  String? name, contact, email, password;

  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // FormKey
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setIndex(0);
                    },
                    child: Container(
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            width: index == 0 ? 5 : 0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      child: const Text(
                        "Contact",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setIndex(1);
                    },
                    child: Container(
                      height: 60,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            width: index == 1 ? 5 : 0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      child: const Text(
                        "Photo",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: IndexedStack(
                  index: index,
                  children: [
                    // Contact Page
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      padding: const EdgeInsets.all(12),
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please enter name !!";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: nameController,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  labelText: "Name",
                                  hintText: "Enter name",
                                  prefixIcon: const Icon(Icons.person),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              15.h,
                              TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please enter number !!";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: contactController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  labelText: "Contact",
                                  hintText: "Enter number",
                                  prefixIcon: const Icon(Icons.phone),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              15.h,
                              TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please enter email !!";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: emailController,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  hintText: "Enter email",
                                  prefixIcon: const Icon(Icons.email),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              15.h,
                              TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Please enter password !!";
                                  } else {
                                    return null;
                                  }
                                },
                                controller: passwordController,
                                obscureText: hide,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  hintText: "Enter password",
                                  prefixIcon: const Icon(Icons.password),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      // 1
                                      // if (hide == true) {
                                      //   hide = false;
                                      // } else {
                                      //   hide = true;
                                      // }
                                      // 2
                                      // if (hide) {
                                      //   hide = false;
                                      // } else {
                                      //   hide = true;
                                      // }
                                      // 3
                                      // hide = hide ? false : true;
                                      // 4
                                      hide = !hide;

                                      setState(() {});
                                    },
                                    icon: Icon(
                                      hide
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              30.h,
                              Text("Name: ${nameController.text}"),
                              Text("Contact: ${contactController.text}"),
                              Text("Email: ${emailController.text}"),
                              Text("Password: ${passwordController.text}"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      nameController.clear();
                                      emailController.clear();
                                      passwordController.clear();
                                      contactController.clear();
                                      setState(() {});
                                    },
                                    child: const Text("CLEAR"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      bool validated =
                                          formKey.currentState!.validate();
                                    },
                                    child: const Text("SAVE"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Photo Page
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
