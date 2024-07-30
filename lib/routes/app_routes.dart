import 'package:flutter/material.dart';
import 'package:resume_builder_app/views/build_option_page/build_option_page.dart';
import 'package:resume_builder_app/views/home_page/home_page.dart';

class AppRoutes {
  static String homePage = "/";
  static String buildOptionPage = "build_option_page";

  static String iconPath = "lib/assets/icons/";

  static List<Map<String, dynamic>> allOptions = [
    {
      'icon': "${iconPath}contact-books.png",
      'title': "Contact Info",
      'route': "contact_info_page",
    },
    {
      'icon': "${iconPath}briefcase.png",
      'title': "Career Objective",
      'route': "career_objective_page",
    },
    {
      'icon': "${iconPath}user.png",
      'title': "Personal Details",
      'route': "personal_details_page",
    },
    {
      'icon': "${iconPath}mortarboard.png",
      'title': "Education",
      'route': "education_info_page",
    },
  ];

  static Map<String, Widget Function(BuildContext)> routes = {
    homePage: (context) => const HomePage(),
    buildOptionPage: (context) => const BuildOptionPage(),
  };
}
