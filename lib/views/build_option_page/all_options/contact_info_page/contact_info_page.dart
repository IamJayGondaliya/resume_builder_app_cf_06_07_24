import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_builder_app/utils/extension.dart';
import 'package:resume_builder_app/utils/globals.dart';

class ContactInfoPage extends StatefulWidget {
  const ContactInfoPage({super.key});

  @override
  State<ContactInfoPage> createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> {
  int index = 0;
  bool hide = true;

  String? name, contact, email, password;

  // TextEditingController nameController =
  //     TextEditingController(text: Globals.name);
  // TextEditingController contactController =
  //     TextEditingController(text: Globals.contact);
  // TextEditingController emailController =
  //     TextEditingController(text: Globals.email);
  // TextEditingController passwordController =
  //     TextEditingController(text: Globals.password);

  // FormKey
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void setIndex(int i) {
    index = i;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
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
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  initialValue: Globals.name,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter name !!";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (val) {
                                    Globals.name = val;
                                  },
                                  // controller: nameController,
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
                                  initialValue: Globals.contact,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter number !!";
                                    } else if (val.length < 10) {
                                      return "Contact number must be of 10 digits !!";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (val) {
                                    Globals.contact = val;
                                  },
                                  // controller: contactController,
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.phone,
                                  maxLength: 10,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
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
                                  initialValue: Globals.email,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter email !!";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (val) {
                                    Globals.email = val;
                                  },
                                  // controller: emailController,
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
                                  initialValue: Globals.password,
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Please enter password !!";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (val) {
                                    Globals.password = val;
                                  },
                                  // controller: passwordController,
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
                                // Text("Name: ${nameController.text}"),
                                // Text("Contact: ${contactController.text}"),
                                // Text("Email: ${emailController.text}"),
                                // Text("Password: ${passwordController.text}"),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        // nameController.clear();
                                        // emailController.clear();
                                        // contactController.clear();
                                        // passwordController.clear();
                                        formKey.currentState!.reset();

                                        // Chained assignment expression
                                        Globals.password = Globals.contact =
                                            Globals.email = Globals.name = null;

                                        setState(() {
                                          log("FORM RESET !!");
                                        });
                                      },
                                      child: const Text("RESET"),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        bool validated =
                                            formKey.currentState!.validate();

                                        if (validated) {
                                          formKey.currentState!.save();

                                          SnackBar snackBar = const SnackBar(
                                            content: Text(
                                                "Form saved successfully... !!"),
                                            backgroundColor: Colors.green,
                                            behavior: SnackBarBehavior.floating,
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        } else {
                                          SnackBar snackBar = const SnackBar(
                                            content: Text(
                                                "Form submission failed ... !!"),
                                            backgroundColor: Colors.red,
                                            behavior: SnackBarBehavior.floating,
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
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
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.25,
                        alignment: Alignment.center,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              foregroundImage: Globals.image != null
                                  ? FileImage(Globals.image!)
                                  : null,
                              child: const Text("Add Image"),
                            ),
                            FloatingActionButton.small(
                              onPressed: () async {
                                ImagePicker picker = ImagePicker();

                                XFile? file = await picker.pickImage(
                                    source: ImageSource.camera);

                                if (file != null) {
                                  log("FILE GOT !!");
                                  Globals.image = File(file.path);
                                  setState(() {});
                                } else {
                                  log("FAILED !!");
                                }
                              },
                              child: const Icon(Icons.camera),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
