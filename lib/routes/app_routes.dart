import 'package:flutter/material.dart';
import 'package:resume_builder_app/views/build_option_page/all_options/contact_info_page/contact_info_page.dart';
import 'package:resume_builder_app/views/build_option_page/all_options/declaration_page/declaration_page.dart';
import 'package:resume_builder_app/views/build_option_page/all_options/personal_details_page/personal_details_page.dart';
import 'package:resume_builder_app/views/build_option_page/build_option_page.dart';
import 'package:resume_builder_app/views/home_page/home_page.dart';
import 'package:resume_builder_app/views/splash_screen/splash_screen.dart';

class AppRoutes {
  static String splashScreen = "/";
  static String homePage = "home_page";
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
    {
      'icon': "${iconPath}declaration.png",
      'title': "Declaration",
      'route': "declaration_page",
    },
  ];

  static Map<String, Widget Function(BuildContext)> routes = {
    splashScreen: (context) => const SplashScreen(),
    homePage: (context) => const HomePage(),
    buildOptionPage: (context) => const BuildOptionPage(),
    allOptions[0]['route']: (context) => const ContactInfoPage(),
    allOptions[2]['route']: (context) => const PersonalInfoPage(),
    allOptions[4]['route']: (context) => const DeclarationPage(),
  };
}
