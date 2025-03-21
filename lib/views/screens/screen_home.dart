/*
* Created by Neloy on 20 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'package:flutter/material.dart';
import 'package:gsl_task/utilities/app_color.dart';
import 'package:gsl_task/utilities/app_text.dart';
import 'package:gsl_task/views/custom_widgets/custom_appbar.dart';
import 'package:gsl_task/views/screens/screen_contact.dart';
import 'package:gsl_task/views/screens/screen_profile.dart';
import 'package:gsl_task/views/screens/screen_ticket.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;

  final List<Widget> _pages = [TicketScreen(), ContactScreen(),ProfileScreen()];

  PreferredSizeWidget _getAppBar() {
    switch (currentPageIndex) {
      case 0:
        return CustomAppbar.primary();
      case 1:
        return CustomAppbar.primary();
      case 2:
        return CustomAppbar.profile();
      default:
        return AppBar(title: Text(AppText.welcome));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        elevation: 100,
        shadowColor: Colors.black,
        selectedIndex: currentPageIndex,
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(
              Icons.confirmation_num,
              color: AppColor.colorBottomAppBarActive,
              size: 20,
            ),
            icon: Icon(
              Icons.confirmation_num_outlined,
              color: AppColor.colorTextTitle,
              size: 20,
            ),
            label: AppText.ticketsCap,
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.group,
              color: AppColor.colorBottomAppBarActive,
              size: 20,
            ),
            icon: Icon(
              Icons.group_outlined,
              color: AppColor.colorTextTitle,
              size: 20,
            ),
            label: AppText.contacts,
          ),
          NavigationDestination(
            selectedIcon: Icon(
              Icons.person,
              color: AppColor.colorBottomAppBarActive,
              size: 20,
            ),
            icon: Icon(
              Icons.person_outlined,
              color: AppColor.colorTextTitle,
              size: 20,
            ),
            label: AppText.profile,
          ),
        ],
      ),
      body: _pages[currentPageIndex],
    );
  }
}
