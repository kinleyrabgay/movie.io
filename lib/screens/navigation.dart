// ------------------ Navigation ------------------------ //
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieio/common/routes/names.dart';
import 'package:movieio/common/utils/constants/colors.dart';
import 'package:movieio/common/utils/constants/image.dart';
import 'package:movieio/common/widgets/icon.image.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentPageIndex = 0;
  List<Widget> pages = [Container(), Container(), Container(), Container()];

  Future<List<Widget>> _loadPages() async {
    List<Widget> loadedPages = [
      await Get.toNamed(AppRoutes.HOME),
      await Get.toNamed(AppRoutes.HOME),
      await Get.toNamed(AppRoutes.HOME),
      await Get.toNamed(AppRoutes.HOME),
    ];

    return loadedPages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MVColors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentPageIndex,
        selectedItemColor: MVColors.primary,
        selectedLabelStyle: const TextStyle(fontSize: 13),
        onTap: (index) async {
          List<Widget> loadedPages = await _loadPages();
          setState(() {
            currentPageIndex = index;
            pages = loadedPages;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: MVIconImage(
              image: MVImageString.jobsIcon,
              index: 0,
              isSelected: 0 == currentPageIndex,
            ),
            label: "Jobs",
          ),
          BottomNavigationBarItem(
            icon: MVIconImage(
              image: MVImageString.resumeIcon,
              index: 1,
              isSelected: 1 == currentPageIndex,
            ),
            label: "Resumes",
          ),
          BottomNavigationBarItem(
            icon: MVIconImage(
              image: MVImageString.orgsIcon,
              index: 2,
              isSelected: 2 == currentPageIndex,
            ),
            label: "Orgs",
          ),
          BottomNavigationBarItem(
            icon: MVIconImage(
              image: MVImageString.profileIcon,
              index: 3,
              isSelected: 3 == currentPageIndex,
            ),
            label: "Profile",
          ),
        ],
      ),
      body: pages[currentPageIndex],
    );
  }
}
